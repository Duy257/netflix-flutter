import 'package:flutter/material.dart';
import 'package:netflix_app/json/root_app_json.dart';
import 'package:netflix_app/modules/root_app/home_page.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int selectTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: selectTab,
      children: const [
        HomePage(),
        Center(
          child: Text('Comming soon'),
        ),
        Center(
          child: Text('Search'),
        ),
        Center(
          child: Text('Download'),
        ),
      ],
    );
  }

  Widget getFooter() {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: const BoxDecoration(color: Colors.black),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(4, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectTab = index;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(items[index]['icon'], color: Colors.white),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  items[index]['text'],
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
