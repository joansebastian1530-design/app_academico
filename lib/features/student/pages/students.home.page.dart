import 'package:app_academico/features/student/models/student.model.dart';
import 'package:app_academico/features/student/pages/students.page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class StudentsHomePage extends StatelessWidget {
  const StudentsHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: const StudentsPage()),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Student? estudiante = null;
          final result =
              await context.push('/students/form', extra: estudiante);
          if (result == true && context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Estudiante cerado correctamente')));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
