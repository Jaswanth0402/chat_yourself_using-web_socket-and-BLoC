import 'dart:convert';

import 'package:web_socket/service/modal/msg_modal.dart';
import 'package:web_socket/service/modal/msg_modal.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketMethods{
 
  static sendData({required String name,required String text, WebSocketChannel? channel}) {   
    if (text.isNotEmpty) {   
String jsonmsg = json.encode(Message(name: name, text: text));
      
      channel?.sink.add(jsonmsg);
        print('added');
    }
  }
  
  
}


