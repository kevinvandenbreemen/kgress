import 'package:flutter/widgets.dart';
import 'package:kevin_gamify/game/MainGame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ControlArea extends StatelessWidget {

  ControlArea({GameModel gameModel}) {

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: FractionalOffset(0.3, 0.90),
      child: Container(
        transform: Matrix4.rotationZ(0.75),
        margin: EdgeInsets.only(
          bottom: 10.0
        ),
        width: 115,
        height: 115,
        decoration: BoxDecoration(
          color: Colors.transparent
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CupertinoButton(
                      child: Icon(CupertinoIcons.left_chevron),
                      onPressed: (){}
                  ),
                  CupertinoButton(
                    child: Icon(CupertinoIcons.right_chevron),
                    onPressed: (){},
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  CupertinoButton(
                      child: Icon(CupertinoIcons.left_chevron),
                      onPressed: (){}
                  ),
                  CupertinoButton(
                    child: Icon(CupertinoIcons.right_chevron),
                    onPressed: (){},
                  )
                ],
              )
            ],
          )
        ),
      ),
    );
  }




}