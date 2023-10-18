import 'package:flutter/material.dart';
import 'package:web_socket/pages/chat_ui.dart';
void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatUI(),
    );
  }
}
