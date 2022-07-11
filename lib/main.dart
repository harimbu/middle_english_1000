import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:middle_english_1000/database/word_dao.dart';
import 'package:middle_english_1000/screen/home_screen.dart';
import 'package:middle_english_1000/theme/themes.dart';

import 'database/database.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('theme');
  await Hive.box('theme').put('darkMode', false);
  if (!GetIt.instance.isRegistered<WordDao>()) {
    final db = MyDatabase();
    GetIt.instance.registerSingleton<WordDao>(WordDao(db));
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('theme').listenable(),
      builder: (_, Box box, child) {
        final darkMode = box.get('darkMode');

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          darkTheme: Themes.dark,
          theme: Themes.light,
          title: '중학 영단어 1000',
          home: HomeScreen(),
        );
      },
    );
  }
}
