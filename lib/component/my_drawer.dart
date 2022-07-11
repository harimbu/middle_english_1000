import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:middle_english_1000/screen/list_screen.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    List menuTitle = [
      '1~100',
      '101~200',
      '201~300',
      '301~400',
      '401~500',
      '501~600',
      '601~700',
      '701~800',
      '801~900',
      '901~1000',
    ];

    _header() {
      return SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/img/logo.png',
                    width: 36,
                    height: 36,
                  ),
                  SizedBox(width: 8),
                  Text(
                    '필수 영단어 1000',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
              ValueListenableBuilder(
                valueListenable: Hive.box('theme').listenable(),
                builder: (_, Box box, widget) {
                  return Switch(
                    value: box.get('darkMode'),
                    onChanged: (value) {
                      box.put('darkMode', value);
                    },
                  );
                },
              )
            ],
          ),
        ),
      );
    }

    _menu() {
      return Flexible(
        child: ListView.builder(
          shrinkWrap: false,
          padding: EdgeInsets.zero,
          itemCount: menuTitle.length,
          itemBuilder: ((context, index) {
            return InkWell(
              onTap: () =>
                  Get.offAll(() => ListScreen(), arguments: menuTitle[index]),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        menuTitle[index],
                        style: Theme.of(context).textTheme.bodySmall,
                        // style: Theme.of(context).textTheme.titleMedium,
                        // style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Image.asset(
                      'assets/img/arrow.png',
                      width: 6,
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      );
    }

    // _tail() {
    //   return Container(
    //     child: Text('중학 필수 영단어 1000'),
    //   );
    // }

    return Drawer(
      child: Column(
        children: [
          _header(),
          _menu(),
          // _tail(),
        ],
      ),
    );
  }
}
