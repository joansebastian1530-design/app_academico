import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../core/router/app.router.dart';
import '../features/login/providers/auth.provider.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  late GoRouter router;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final authProvider = context.read<AuthProvider>();

    router = createRouter(authProvider);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,

      debugShowCheckedModeBanner: false,
      title: 'Mini Universidad',

      themeMode: ThemeMode.system,

      theme: FlexThemeData.light(
        scheme: FlexScheme.blueM3,
        useMaterial3: true,
      ),

      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.outerSpace,
        useMaterial3: true,
      ),
    );
  }
}