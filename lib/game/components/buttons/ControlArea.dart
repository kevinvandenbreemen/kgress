import 'package:flutter/widgets.dart';
import 'package:kevin_gamify/game/MainGame.dart';
import 'package:flutter/cupertino.dart';

class ControlArea extends StatelessWidget {

  ControlArea({GameModel gameModel}) {

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: FractionalOffset(1.0, 1.0),
      child: Container(
        margin: EdgeInsets.only(
          bottom: 10.0
        ),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: CupertinoColors.white
        ),
        child: Center(
          child: Text("Controls"),
        ),
      ),
    );
  }




}