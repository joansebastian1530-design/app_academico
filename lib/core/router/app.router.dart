import 'package:app_academico/features/login/providers/auth.provider.dart';
import 'package:app_academico/features/student/pages/students.form.page.dart';
import 'package:app_academico/features/student/pages/students.home.page.dart';
import 'package:app_academico/features/subject/pages/subject.detail.page.dart';
import 'package:app_academico/features/subject/pages/subject.page.dart';
import 'package:app_academico/pages/chat.page.dart';
import 'package:app_academico/pages/home.page.dart';
import 'package:app_academico/pages/profile.page.dart';
import 'package:go_router/go_router.dart';

import '../../features/student/models/student.model.dart';

import '../../features/welcome/welcome.page.dart';

import '../../features/student/pages/students.detail.page.dart';
import '../../app/app.shell.widget.dart';
import '../../pages/login.page.dart';

GoRouter createRouter(AuthProvider authProvider) {
  return GoRouter(
    initialLocation: '/',

    refreshListenable: authProvider,

    redirect: (context, state) {
      final isLoggedIn = authProvider.isAuthenticated;

      final location = state.matchedLocation;

      const publicRoutes = ['/', '/login'];

      final isPublicRoute = publicRoutes.contains(location);

      if (!isLoggedIn && !isPublicRoute) {
        return '/login';
      }

      if (isLoggedIn && isPublicRoute) {
        return '/home';
      }

      return null;
    },

    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return AppShellWidget(child: child);
        },

        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) {
              return const HomePage();
            },
          ),
          GoRoute(
            path: '/subjects',
            builder: (context, state) {
              return const SubjectsPage();
            },
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) {
              return const ProfilePage();
            },
          ),
        ],
      ),

      GoRoute(
        path: '/',
        builder: (context, state) {
          return WelcomePage();
        },
      ),

      GoRoute(
        path: '/login',
        builder: (context, state) {
          return LoginPage();
        },
      ),

      GoRoute(
        path: '/students',
        builder: (context, state) {
          return StudentsHomePage();
        },
      ),

      GoRoute(
        path: '/student/form',
        builder: (context, state) {
          final student = state.extra as Student?;
          return StudentsFormPage(student: student);
        },
      ),

      GoRoute(
        path: '/student/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return StudentDetailPage(id: id);
        },
      ),

      GoRoute(
        path: '/subject/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return SubjectDetailPage(id: id);
        },
      ),

      GoRoute(
        path: '/chat',
        builder: (context, state) {
          return const ChatPage();
        },
      ),
    ],
  );
}

