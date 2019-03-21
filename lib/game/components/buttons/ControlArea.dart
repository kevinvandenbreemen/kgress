import 'package:flutter/widgets.dart';
import 'package:kevin_gamify/game/MainGame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class ControlArea extends StatelessWidget {

  GameModel _model;

  ControlArea({GameModel gameModel}) {
    this._model = gameModel;
  }

  void _left() {
    debugPrint("LEFT");
  }

  void _right() {
    debugPrint("RIGHT");
  }

  void _up() {
    debugPrint("UP");
  }

  void _down() {
    debugPrint("DOWN");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: FractionalOffset(0.3, 0.90),
      child: Container(
        margin: EdgeInsets.only(
          bottom: 10.0
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.transparent
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  FlatButton(
                      child: Image.asset("assets/images/arrow_left.png"),
                      onPressed: _left
                  ),
                  FlatButton(
                    child: Image.asset("assets/images/arrow_down.png"),
                    onPressed: _down,
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  FlatButton(
                      child: Image.asset("assets/images/arrow_up.png"),
                      onPressed: _up
                  ),
                  FlatButton(
                    child: Image.asset("assets/images/arrow_right.png"),
                    onPressed: _right,
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