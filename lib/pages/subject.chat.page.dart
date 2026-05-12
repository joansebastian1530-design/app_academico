import 'package:flutter/material.dart';
class SubjectChatPage extends StatelessWidget {
const SubjectChatPage({super.key});
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Chat de Materia'),
),
body: const Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(
Icons.chat_bubble,
size: 80,
color: Colors.blue,
),
SizedBox(height: 20),
Text(
'Chat de la materia',
style: TextStyle(fontSize: 22),
),
],
),
),
);
}
}
