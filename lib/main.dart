import 'package:flutter/material.dart';
import 'package:recruitment_app/routing/app_router.dart';
import 'package:recruitment_app/services/database_service.dart';
import 'package:recruitment_app/services/initial_setup_service.dart';

void main() {
  InitialSetupService().initialSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Recruitment App',
      routerConfig: AppRouter.appRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
