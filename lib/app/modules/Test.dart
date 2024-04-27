import 'package:flutter/material.dart';
import 'package:mahaduna_apps/app/modules/bottom_navigate/views/bottom_navigate_view.dart';

class Test extends StatelessWidget {
  final bottomBar = BottomNavigateView();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('ya')),
    );
  }
}
