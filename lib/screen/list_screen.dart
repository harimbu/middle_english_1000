import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:middle_english_1000/database/database.dart';
import 'package:middle_english_1000/screen/book_screen.dart';
import 'package:middle_english_1000/theme/themes.dart';

import '../component/my_drawer.dart';

import '../database/database.dart';
import '../database/word_dao.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final FlutterTts tts = FlutterTts();

  String? title = Get.arguments;
  startApp() async {
    if (title == null) title = '1~100';
    await tts.setLanguage('en');
    await tts.setSpeechRate(0.5);
  }

  @override
  void initState() {
    super.initState();
    startApp();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('theme').listenable(),
      builder: (_, Box box, child) {
        return Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(
            title: Text(title!),
            actions: [
              IconButton(
                onPressed: () {
                  Get.to(() => BookScreen());
                },
                icon: Image.asset(
                  box.get('darkMode')
                      ? 'assets/img/book-dark.png'
                      : 'assets/img/book.png',
                  width: 24,
                ),
              ),
            ],
          ),
          body: _body(),
        );
      },
    );
  }

  _body() {
    return StreamBuilder<List<WordData>>(
      stream: GetIt.instance<WordDao>().streamWords(title!),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (_, index) {
              return Container(child: _list(item: items[index]));
            },
          );
        } else {
          return Center(child: Text('no data'));
        }
      },
    );
  }

  _list({item}) {
    final box = Hive.box('theme');

    return ListTile(
      tileColor: item.adding == 0
          ? box.get('darkMode') ?? false
              ? Themes.darkBg1
              : Themes.bg1
          : box.get('darkMode') ?? false
              ? Themes.black
              : Themes.bg2,
      minLeadingWidth: 24,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              final dao = GetIt.instance<WordDao>();
              dao.updateShowing(item.id, item.showing == 0 ? 1 : 0);
            },
            icon: item.showing == 0
                ? Image.asset(
                    box.get('darkMode') ?? false
                        ? 'assets/img/check-dark.png'
                        : 'assets/img/check-light.png',
                    width: 18,
                    height: 18,
                  )
                : Image.asset(
                    box.get('darkMode') ?? false
                        ? 'assets/img/check-on.png'
                        : 'assets/img/check-on.png',
                    width: 18,
                    height: 18,
                  ),
          ),
        ],
      ),
      title: InkWell(
        onTap: () {
          tts.speak(item.eng);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.eng,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              item.showing == 0
                  ? Container()
                  : Column(
                      children: [
                        SizedBox(height: 8),
                        Text(
                          item.kor,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          final dao = GetIt.instance<WordDao>();
          dao.updateAdding(item.id, item.adding == 0 ? 1 : 0);

          Get.snackbar(
            item.eng,
            item.adding == 0 ? '단어장에 추가되었습니다.' : '단어장에서 삭제되었습니다',
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(milliseconds: 1000),
            // reverseAnimationCurve: Curves.ease,
          );
        },
        icon: item.adding == 0
            ? Image.asset(
                'assets/img/plus.png',
                width: 18,
                height: 18,
              )
            : Image.asset(
                'assets/img/plus-on.png',
                width: 18,
                height: 18,
              ),
      ),
    );
  }
}
