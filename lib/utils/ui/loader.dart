import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final String title;
  final Color color;
  Loader({this.title = "", this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Material(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
