import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kevin_gamify/game/MainGame.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        barBackgroundColor: CupertinoColors.darkBackgroundGray,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: CupertinoColors.darkBackgroundGray,
        textTheme: CupertinoTextThemeData(
          primaryColor: Colors.orange,
          textStyle: TextStyle(
            color: Colors.orangeAccent
          )
        )
      ),
      home: GameScaffold(),
    );
  }
}

class GameScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.black,
        actionsForegroundColor: CupertinoColors.extraLightBackgroundGray,
        trailing: CupertinoButton(
          child: Icon(CupertinoIcons.book_solid, color: Colors.orangeAccent,),
          onPressed: ()=>debugPrint("GOt pressed"),
        )

      ),
      child: GameWorld(),
    );
  }
  
}

class GameWorld extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GameModel().widget()
      ],
    );
  }
}