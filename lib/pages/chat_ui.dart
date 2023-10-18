import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket/base/card.dart';
import 'package:web_socket/service/bloc/chat_bloc.dart';

// ignore: must_be_immutable
class ChatUI extends StatefulWidget {
  ChatUI({super.key});

  @override
  State<ChatUI> createState() => _ChatUIState();
}

class _ChatUIState extends State<ChatUI> {
List?msgis=[];
  @override
  void initState() {
  chatBloc.add(InitialMsgConnectEvent());
  // setState(() {
  //   msgis;
  // });
    super.initState();
  }

  ChatBloc chatBloc = ChatBloc();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatBloc, ChatState>(
      bloc: chatBloc,
      listenWhen: (previous, current) => current is ChatActionState,
      buildWhen: (previous, current) => current is !ChatActionState,
      listener: (context, state) {
        // if(state is SendDataSuccessState){
           
          
        // }

      },
      builder: (context, state) {
        if(state is ConnectionSuccessState){
               msgis?.add(state.msg);
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text("Chat YourSelf"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Expanded(
                    child: Container(
                  child: ListView.builder(
                     
                      itemCount:msgis?.length,
                      itemBuilder: (context, index) {
                          return MyCard(
                            msg:msgis?[index]
                          ); 
                      }
                      ),
                )),
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
                          chatBloc.add(MsgSendEvent(text: controller.text));
                          controller.clear();
                        },
                        icon: const Icon(Icons.send))
                  ]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

@override
void dispose(){
chatBloc.add(InitialChannelCloseEvent());
  super.dispose();
}
 
}
