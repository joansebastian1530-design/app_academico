import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class SubjectsPage extends StatelessWidget {
const SubjectsPage({super.key});
@override
Widget build(BuildContext context) {
final subjects = [
{
'id': '1',
'name': 'Programación',
},
{
'id': '2',
'name': 'Matemáticas',
},
{
'id': '3',
'name': 'Bases de Datos',
},
{
'id': '4',
'name': 'Redes',
},
{
'id': '5',
'name': 'Diseño Web',
},
];
return ListView.builder(
itemCount: subjects.length,
itemBuilder: (context, index) {
final subject = subjects[index];
return ListTile(
leading: const Icon(Icons.book),
title: Text(subject['name']!),
trailing: const Icon(Icons.arrow_forward_ios),
onTap: () {
context.push('/subject/${subject['id']}');
},
);
},
);
}
}