import 'package:app_academico/features/carrer/providers/career.provider.dart';
import 'package:app_academico/features/student/subject/providers/subject.provider.dart';
import 'package:flutter/material.dart';
import 'app.widget.dart';
import 'package:provider/provider.dart';

import 'features/student/providers/student.provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => StudentProvider()..loadStudents(),
        ),
        ChangeNotifierProvider(
          create: (_) =>
              SubjectProvider()..loadSubjects(),
        ),
        ChangeNotifierProvider(
      create: (_) => CareerProvider()..loadCareers(),
    ),

      ],
      child: const AppWidget(),
    ),
  );
}
