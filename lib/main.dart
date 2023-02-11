import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reqres_in_clean_architecture/features/user/presentation/cubit/user_cubit.dart';
import 'package:reqres_in_clean_architecture/injection/injection.dart';

import 'features/user/presentation/pages/user/user_page.dart';

void main() async {
  await register();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => UserCubit()..getUsers(),
        child: const UserPage(),
      ),
    );
  }
}
