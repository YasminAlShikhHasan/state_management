import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newpro/theme/theme_switcher_bloc.dart';
import 'package:newpro/theme/theme_switcher_event.dart';

void main() {
  //..add : ليتمكن المستخدم من الدخول للحالة الابتدائية اولا
  runApp(BlocProvider(
      create: (context) => themeSwitchBloc()..add(setInitialTheme()),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<themeSwitchBloc, ThemeData>(
      builder: (context, state) {
        return MaterialApp(
          theme: state,
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<themeSwitchBloc, ThemeData>(builder: (context, state) {
            return CupertinoSwitch(
                value: state == ThemeData.dark(),
                onChanged: (bool value) {
                  context.read<themeSwitchBloc>().add(switchTheme());
                });
          }),
        ],
      ),
    );
  }
}
