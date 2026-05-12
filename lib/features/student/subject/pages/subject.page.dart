import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../providers/subject.provider.dart';

class SubjectsPage extends StatelessWidget {
  const SubjectsPage({super.key});

  @override
  Widget build(BuildContext context) {

    /// ESCUCHA EL PROVIDER
    final subjects = context.watch<SubjectProvider>().subjects;

    if (subjects.isEmpty) {
      return const Center(
        child: Text("No hay asignaturas"),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: subjects.length,

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),

      itemBuilder: (context, index) {

        final subject = subjects[index];

        return _SubjectCard(
          subjectName: subject.name,
          code: subject.code,
          index: index,
        );
      },
    );
  }
}

class _SubjectCard extends StatelessWidget {

  final String subjectName;
  final String code;
  final int index;

  const _SubjectCard({
    required this.subjectName,
    required this.code,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        context.push('/subject/${index + 1}');
      },

      child: Card(
        elevation: 4,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            /// ICONO
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),

                child: Container(
                  width: double.infinity,
                  color: Colors.indigo.shade100,

                  child: const Icon(
                    Icons.menu_book,
                    size: 70,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ),

            /// INFORMACIÓN
            Padding(
              padding: const EdgeInsets.all(12),

              child: Column(
                children: [

                  Text(
                    subjectName,
                    textAlign: TextAlign.center,

                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    code,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}