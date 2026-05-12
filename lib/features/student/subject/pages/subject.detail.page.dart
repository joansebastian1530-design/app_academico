import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/subject.provider.dart';
import '../models/subject.model.dart';

class SubjectDetailPage extends StatelessWidget {

  final String id;

  const SubjectDetailPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {

    /// PROVIDER
    final provider = context.watch<SubjectProvider>();

    /// CONVERTIR ID
    final subjectId = int.tryParse(id);

    /// BUSCAR ASIGNATURA
    final Subject? subject =
        subjectId != null
            ? provider.getById(subjectId)
            : null;

    /// SI NO EXISTE
    if (subject == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Asignatura'),
        ),

        body: const Center(
          child: Text('Asignatura no encontrada'),
        ),
      );
    }

    return Scaffold(

      appBar: AppBar(
        title: Text(subject.name),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            /// ICONO
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.indigo.shade100,

              child: const Icon(
                Icons.menu_book,
                size: 60,
                color: Colors.indigo,
              ),
            ),

            const SizedBox(height: 20),

            /// NOMBRE
            Text(
              subject.name,

              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            /// CODIGO
            Text(
              'Código: ${subject.code}',

              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            const Divider(height: 30),

            _infoTile(
              Icons.code,
              "Código",
              subject.code,
            ),

            _infoTile(
              Icons.credit_score,
              "Créditos",
              subject.credits.toString(),
            ),

            _infoTile(
              Icons.access_time,
              "Horas",
              subject.hours.toString(),
            ),

            _infoTile(
              Icons.account_balance,
              "Área de conocimiento",
              subject.knowledgeArea,
            ),

            _infoTile(
              Icons.school,
              "Carrera",
              subject.career,
            ),

            _infoTile(
              Icons.layers,
              "Nivel",
              subject.level,
            ),
          ],
        ),
      ),
    );
  }
}

/// WIDGET REUTILIZABLE
class _infoTile extends StatelessWidget {

  final IconData icon;
  final String label;
  final String value;

  const _infoTile(
    this.icon,
    this.label,
    this.value,
  );

  @override
  Widget build(BuildContext context) {

    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}