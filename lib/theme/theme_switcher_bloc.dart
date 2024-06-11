import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newpro/theme/theme_switcher_event.dart';
import 'package:shared_preferences/shared_preferences.dart';

class themeSwitchBloc extends Bloc<ThemeSwitcherEvent, ThemeData> {
  themeSwitchBloc() : super(ThemeData.light()) {
    on<setInitialTheme>(
      (event, emit) async {
        bool hasThemeDark = await isDark();
        emit(hasThemeDark ? ThemeData.dark() : ThemeData.light());
      },
    );
    on<switchTheme>((event, emit) async {
      bool hasThemeDark = state == ThemeData.dark();
      emit(hasThemeDark ? ThemeData.light() : ThemeData.dark());
      setTheme(!hasThemeDark);
    });
  }
}

Future<bool> isDark() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  return sharedPreferences.getBool('is_dark') ?? false;
}

Future<void> setTheme(bool isDark) async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sharedPreferences.setBool('is_dark', isDark);
}