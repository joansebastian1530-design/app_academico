import 'package:app_academico/app/app.shell.widget.dart';
import 'package:app_academico/features/documents/pages/documents.page.dart';
import 'package:app_academico/features/login/pages/login.page.dart';
import 'package:app_academico/features/login/pages/register.page.dart';
import 'package:app_academico/features/login/providers/auth.provider.dart';
import 'package:app_academico/features/student/models/student.model.dart';
import 'package:app_academico/features/student/pages/students.detail.page.dart';
import 'package:app_academico/features/student/pages/students.form.page.dart';
import 'package:app_academico/features/student/pages/students.home.page.dart';
import 'package:app_academico/features/subject/pages/subject.detail.page.dart';
import 'package:app_academico/features/subject/pages/subject.page.dart';
import 'package:app_academico/features/welcome/welcome.page.dart';
import 'package:app_academico/pages/chat.page.dart';
import 'package:app_academico/pages/home.page.dart';
import 'package:app_academico/pages/profile.page.dart';
import 'package:go_router/go_router.dart';

GoRouter createRouter(AuthProvider authProvider) {
  return GoRouter(
    initialLocation: '/',

    refreshListenable: authProvider,

    redirect: (context, state) {
      final isLoggedIn = authProvider.isAuthenticated;
      final location = state.matchedLocation;

      const publicRoutes = [
        '/',
        '/login',
        '/register',
      ];

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
      // =========================
      // PUBLIC ROUTES
      // =========================

      GoRoute(
        path: '/',
        builder: (context, state) => WelcomePage(),
      ),

      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),

      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),

      // =========================
      // SHELL ROUTES
      // =========================

      ShellRoute(
        builder: (context, state, child) {
          return AppShellWidget(child: child);
        },

        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomePage(),
          ),

          GoRoute(
            path: '/subjects',
            builder: (context, state) => const SubjectsPage(),
          ),

          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfilePage(),
          ),

          GoRoute(
            path: '/documents',
            builder: (context, state) => const DocumentsPage(),
          ),

          GoRoute(
            path: '/students',
            builder: (context, state) => StudentsHomePage(),
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
            builder: (context, state) => const ChatPage(),
          ),
        ],
      ),
    ],
  );
}