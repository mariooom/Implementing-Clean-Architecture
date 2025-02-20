import 'package:clean_arch/core/cubit/task/user_cubit.dart';
import 'package:clean_arch/presentaion/pages/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init(); // Initialize Dependency Injection
  runApp(
    BlocProvider(
      create: (context) => UserCubit(di.sl()), // Inject dependencies
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserScreen(),
    );
  }
}