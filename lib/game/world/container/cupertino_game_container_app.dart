import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoGameContainerApp extends StatelessWidget {

  StatelessWidget _gameWorldWidget;

  CupertinoGameContainerApp(this._gameWorldWidget);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
          barBackgroundColor: CupertinoColors.darkBackgroundGray,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: CupertinoColors.darkBackgroundGray,
          primaryContrastingColor: CupertinoColors.white,
          textTheme: CupertinoTextThemeData(
              primaryColor: Colors.orange,
              textStyle: TextStyle(
                  color: Colors.orangeAccent
              )
          )
      ),
      home: _gameWorldWidget,
    );
  }
}
