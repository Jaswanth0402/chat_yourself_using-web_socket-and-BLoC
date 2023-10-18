import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:web_socket/service/function/socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  WebSocketChannel channel = WebSocketChannel.connect(Uri.parse(
        "wss://free.blr2.piesocket.com/v3/1?api_key=up3vboHjvHwv2ls80sySsnN5FZv1qtUSlI5zA9Xe&notify_self=1"));
  StreamSubscription<dynamic>? subscription;
  ChatBloc() : super(ChatInitial()) {
   on<InitialMsgConnectEvent>(initialMsgConnectEvent);
   on<InitialChannelCloseEvent>(initialChannelCloseEvent);
   on<MsgSendEvent>(msgSendEvent);
  }

  FutureOr<void> initialMsgConnectEvent(InitialMsgConnectEvent event, Emitter<ChatState> emit)async{
     await for (final data in channel.stream) {
      final message = ConnectionSuccessState(msg:data.toString());
      emit(message);
    }
  }
  

  FutureOr<void> msgSendEvent(MsgSendEvent event, Emitter<ChatState> emit){
    emit(SendDataLoadingState());
     SocketMethods.sendData( text: event.text,channel: channel);
    //  print('data sent');
     emit(SendDataSuccessState());
      
  }

  FutureOr<void> initialChannelCloseEvent(InitialChannelCloseEvent event, Emitter<ChatState> emit) {  
    subscription?.cancel();
 channel.sink.close();
  }
 
}



