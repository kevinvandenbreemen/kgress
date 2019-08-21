import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kgress/game/components/buttons/ControlsDelegate.dart';

class ControlArea extends StatelessWidget {

  final ControlsDelegate _delegate;

  /// Define control area such that button presses will trigger calls to the methods
  /// on the given [_delegate]
  ControlArea(this._delegate);

  void _left() {
    _delegate.onPressedLeft();
  }

  void _right() {
    _delegate.onPressedRight();
  }

  void _up() {
    _delegate.onPressedUp();
  }

  void _down() {
    _delegate.onPressedDown();
  }

  void _stationary() {
    _delegate.onRelease();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: FractionalOffset(0.0, 1.0),
      child: Container(
        margin: EdgeInsets.only(
          bottom: 10.0
        ),
        width: 178,
        height: 178,
        decoration: BoxDecoration(
          color: Colors.transparent
        ),
        child: Column(
          children: <Widget>[
            Center(
              child: GestureDetector(
                onTapDown: (TapDownDetails){_up();},
                onTapUp: (TapUpDetails){_stationary();},
                child: FlatButton(
                    child: Image.asset("assets/images/arrow_up.png")
                ),
              )
            ),
            Center(
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                        onTapDown: (TapDownDetails){_left();},
                        onTapUp: (TapUpDetails){_stationary();},
                        child: FlatButton(
                            child: Image.asset("assets/images/arrow_left.png")
                        )
                    ),
                    GestureDetector(
                        onTapDown: (TapDownDetails){_right();},
                        onTapUp: (TapUpDetails){_stationary();},
                        child: FlatButton(
                          child: Image.asset("assets/images/arrow_right.png"),
                        )
                    )
                  ],
                )
            ),
            Center(
                child: GestureDetector(
                    onTapDown: (TapDownDetails){_down();},
                    onTapUp: (TapUpDetails){_stationary();},
                    child: FlatButton(
                      child: Image.asset("assets/images/arrow_down.png"),
                    )
                )
            )
          ],
        ),
      ),
    );
  }




}