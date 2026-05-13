import 'package:app_academico/features/student/pages/students.home.page.dart';
import 'package:app_academico/features/student/providers/student.provider.dart';
import 'package:app_academico/features/student/subject/pages/subject.page.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../pages/chat.page.dart';
import '../../pages/home.page.dart';
import '../../pages/profile.page.dart';
import '../../features/student/pages/students.detail.page.dart';
import '../../features/student/pages/students.page.dart';
import '../../features/student/subject/pages/subject.detail.page.dart';
import '../../pages/subject.chat.page.dart';
import '../../widgets/app.shell.widget.dart';
final GoRouter appRouter = GoRouter(
initialLocation: '/home',
routes: [
/// ===================================
/// SHELL ROUTE
/// ===================================
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
path: '/students',
builder: (context, state) {
return const StudentsHomePage();
},
),
GoRoute(
path: '/students',
builder: (context, state) {
return const StudentsPage();
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
GoRoute(
          path: '/students',
          builder: (context, state) {
            return ChangeNotifierProvider(
              create: (_) => StudentProvider()..loadStudents(),
              child: const StudentsPage(),
            );
          },

),
],
),
/// ===================================
/// RUTAS FULLSCREEN
/// ===================================
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
path: '/subject-chat',
builder: (context, state) {
return const SubjectChatPage();
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