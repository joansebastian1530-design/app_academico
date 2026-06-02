import 'package:app_academico/features/academic_program/providers/academic.program.provider.dart';
import 'package:app_academico/features/login/providers/auth.provider.dart';
import 'package:app_academico/features/user/providers/user.provider.dart';
import 'package:app_academico/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app.startup.dart';
import 'app/app.widget.dart';

import 'features/student/providers/student.provider.dart';
import 'features/subject/providers/subject.provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        /// ============================
        /// STUDENTS
        /// ============================
        ChangeNotifierProvider(
          create: (_) => StudentProvider()..loadStudents(),
        ),

        /// ============================
        /// SUBJECTS
        /// ============================
        ChangeNotifierProvider(
          create: (_) => SubjectProvider()..loadSubjects(),
        ),

        /// ============================
        /// ACADEMIC PROGRAMS
        /// ============================
        ChangeNotifierProvider(
          create: (_) => AcademicProgramProvider()..loadAcademicPrograms(),
        ),

        /// ============================
        /// CURRENT USER
        /// ============================
        ChangeNotifierProvider(create: (_) => UserProvider()),

        /// ============================
        /// AUTHENTICATION
        /// ============================
        ChangeNotifierProxyProvider<UserProvider, AuthProvider>(
          create: (context) =>
              AuthProvider(userProvider: context.read<UserProvider>()),

          update: (context, userProvider, previous) =>
              previous ?? AuthProvider(userProvider: userProvider),
        ),
      ],

      child: const AppStartup(child: AppWidget()),
    ),
  );
}
