import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket/base/card.dart';
import 'package:web_socket/service/bloc/chat_bloc.dart';
import 'package:web_socket/service/modal/msg_modal.dart';


// ignore: must_be_immutable
class ChatUI extends StatefulWidget {
  String name;
  String email;

  ChatUI({super.key,required this.name,required this.email});

  @override
  State<ChatUI> createState() => _ChatUIState();
}

class _ChatUIState extends State<ChatUI> {

  @override
  void initState() {
  chatBloc.add(InitialMsgConnectEvent());
    super.initState();
  }
  
 

  ChatBloc chatBloc = ChatBloc();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            title: const Text("Chat YourSelf"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Expanded(
                  
                child: BlocConsumer(
                  bloc: chatBloc,
      listenWhen: (previous, current) => current is ChatActionState,
      buildWhen: (previous, current) => current is !ChatActionState,
      listener: (context, state) {  },
      builder: (context, state){
      
        if(state is ConnectionSuccessState){
               return Container(
                    child:  ListView.builder(
                        itemCount:state.msg.length,
                        itemBuilder: (context, index) { 
                            return GestureDetector(
                              onTap:(){
                                  
                              },
                              child: MyCard(
                                sendname:widget.name,
                                recievename:state.msg[index]['name'],
                                msg:state.msg[index]['text']
                              ),
                            );
                 }
        
                    ));}
                    else{
                      return
                      const SizedBox(height: 8,);
                    }}
                )
         
                   ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Row(children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          hintText: "Message...",
                          hintStyle: TextStyle(color: Colors.blue),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          chatBloc.add(MsgSendEvent(name:widget.name ,text:controller.text)
                        );
                          controller.clear();
                        },
                        icon: const Icon(Icons.send))
                  ]),
                ),
              ],
            ),
          ),
        );
  }

@override
void dispose(){
chatBloc.add(InitialChannelCloseEvent());
  super.dispose();
}
 
}
