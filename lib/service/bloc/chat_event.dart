part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {}

class InitialMsgConnectEvent extends ChatEvent{
}
class InitialChannelCloseEvent extends ChatEvent{
}

class MsgSendEvent extends ChatEvent{
final String name;
final String text;


  MsgSendEvent({required this.text,required this.name});
}
