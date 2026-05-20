import 'package:app_academico/features/welcome/welcome.page.dart';
import 'package:go_router/go_router.dart';

import 'package:app_academico/features/student/models/student.model.dart';

import 'package:app_academico/features/student/pages/students.home.page.dart';
import 'package:app_academico/features/student/pages/students.detail.page.dart';
import 'package:app_academico/features/student/pages/students.form.page.dart';

import 'package:app_academico/features/student/subject/pages/subject.page.dart';
import 'package:app_academico/features/student/subject/pages/subject.detail.page.dart';

import 'package:app_academico/pages/chat.page.dart';
import 'package:app_academico/pages/home.page.dart';
import 'package:app_academico/pages/profile.page.dart';
import 'package:app_academico/pages/subject.chat.page.dart';

import 'package:app_academico/widgets/app.shell.widget.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',

  routes: [
    /// ===================================
    /// SHELL
    /// ===================================
    ShellRoute(
      builder: (context, state, child) {
        return AppShellWidget(child: child);
      },

      routes: [
        /// Assets
        GoRoute(
      path: '/',
      builder: (context, state) {
        return const WelcomePage();
      },
    ),
 
        /// HOME
        GoRoute(
          path: '/home',
          builder: (context, state) {
            return const HomePage();
          },
        ),

        /// PROFILE
        GoRoute(
          path: '/profile',
          builder: (context, state) {
            return const ProfilePage();
          },
        ),

        /// STUDENTS
        GoRoute(
          path: '/students',
          builder: (context, state) {
            return const StudentsHomePage();
          },
        ),

        /// SUBJECTS
        GoRoute(
          path: '/subjects',
          builder: (context, state) {
            return const SubjectsPage();
          },
        ),
      ],
    ),

    /// ===================================
    /// FULLSCREEN ROUTES
    /// ===================================

    /// DETAIL STUDENT
    GoRoute(
      path: '/student/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return StudentDetailPage(id: id);
      },
    ),

    /// FORM STUDENT
    GoRoute(
      path: '/students/form',
      builder: (context, state) {
        final student = state.extra as Student?;
        return StudentsFormPage(student: student);
      },
    ),

    /// DETAIL SUBJECT
    GoRoute(
      path: '/subject/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return SubjectDetailPage(id: id);
      },
    ),

    /// SUBJECT CHAT
    GoRoute(
      path: '/subject-chat',
      builder: (context, state) {
        return const SubjectChatPage();
      },
    ),

    /// CHAT
    GoRoute(
      path: '/chat',
      builder: (context, state) {
        return const ChatPage();
      },
    ),
  ],
);