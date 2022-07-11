import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:middle_english_1000/screen/list_screen.dart';
import 'package:middle_english_1000/theme/themes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 46.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/img/logo.png',
              width: 55,
              height: 55,
            ),
            SizedBox(height: 26),
            Text(
              '중학 필수 영단어 \n1000',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(height: 72),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => ListScreen());
                    },
                    child: Text(
                      '시작하기',
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Themes.accent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                      padding: EdgeInsets.all(14),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
