import 'package:flutter/material.dart';
import 'package:is_1893_assistant/screen/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowGlow();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Earthquake Resistant',
        home: HomePage(),
      ),
    );
  }
}
