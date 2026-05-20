import 'package:app_academico/widgets/infot.title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../providers/student.provider.dart';
import '../models/student_view.dart';

class StudentDetailPage extends StatelessWidget {
  final String id;

  const StudentDetailPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    /// PROVIDER
    final provider = context.watch<StudentProvider>();

    /// CONVERTIR ID
    final studentId = int.tryParse(id);

    /// BUSCAR STUDENT VIEW
    StudentView? studentView;

    if (studentId != null) {
      try {
        studentView = provider.students.firstWhere(
          (s) => s.student.id == studentId,
        );
      } catch (e) {
        studentView = null;
      }
    }

    /// SI NO EXISTE
    if (studentView == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Nuevo Estudiante'),
        ),
        body: const Center(
          child: Text('Estudiante no encontrado'),
        ),
      );
    }

    final student = studentView.student;
    final career = studentView.career;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${student.firstName} ${student.lastName}',
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.edit),

            onPressed: () async {
              final result = await context.push(
                '/students/form',
                extra: student,
              );

              if (result == true && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Estudiante actualizado',
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            /// FOTO
            CircleAvatar(
              radius: 60,

              backgroundImage:
                  student.photoUrl.isNotEmpty
                      ? AssetImage(student.photoUrl)
                      : null,

              child:
                  student.photoUrl.isEmpty
                      ? const Icon(
                          Icons.person,
                          size: 60,
                        )
                      : null,
            ),

            const SizedBox(height: 20),

            /// NOMBRE
            Text(
              '${student.firstName} ${student.lastName}',

              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            /// CÓDIGO
            Text(
              'Código: ${student.code}',

              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 10),

            /// CARRERA
            Chip(
              avatar: const Icon(Icons.school),

              label: Text(
                career.name,
              ),
            ),

            const Divider(height: 30),

            infoTile(
              Icons.badge,
              "Género",
              student.gender,
            ),

            infoTile(
              Icons.email,
              "Email",
              student.email,
            ),

            infoTile(
              Icons.phone,
              "Teléfono",
              student.phone,
            ),

            infoTile(
              Icons.cake,
              "Fecha nacimiento",
              "${student.birthDate.day}/${student.birthDate.month}/${student.birthDate.year}",
            ),

            const SizedBox(height: 30),

            /// CHAT
            FilledButton.icon(
              onPressed: () {
                context.push('/chat');
              },

              icon: const Icon(Icons.chat),

              label: const Text(
                'Abrir Chat',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
