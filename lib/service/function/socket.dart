import 'package:web_socket_channel/web_socket_channel.dart';

class SocketMethods{
 
  static sendData({required String text, WebSocketChannel? channel}) {
    // print("data sending");
 
    if (text.isNotEmpty) {
      channel?.sink.add(text);
         text = '';
    }
  }
  
  
}


