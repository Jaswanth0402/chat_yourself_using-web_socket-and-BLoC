import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String msg;
  const MyCard({super.key,required this.msg});

  @override
  Widget build(BuildContext context) {
    return Align(
                    alignment: Alignment.bottomRight,
                    child: ConstrainedBox(
                      constraints:  BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width - 105,
                      ),
                      child: Card(
                        color: Colors.greenAccent,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 13),
                          child: Column(
                            children: [
                              Text(msg.toString())
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
  }
}