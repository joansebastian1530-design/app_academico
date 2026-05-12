import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class SubjectDetailPage extends StatelessWidget {
final String id;
const SubjectDetailPage({
super.key,
required this.id,
});
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Detalle Materia'),
),
body: Padding(
padding: const EdgeInsets.all(20),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'Materia ID: $id',
style: const TextStyle(
fontSize: 24,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 20),
const Text(
'Información básica de la materia.',
style: TextStyle(fontSize: 18),
),
const SizedBox(height: 30),
ElevatedButton.icon(
onPressed: () {
context.push('/subject-chat');
},
icon: const Icon(Icons.chat),
label: const Text('Abrir Chat'),
),
],
),
),
);
}
}