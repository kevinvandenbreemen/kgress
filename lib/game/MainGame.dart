import 'package:flame/game.dart';
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flame/flame.dart';

/// Model of the game.
class GameModel {

  _MainGame _game;

  /// Add any image pre-loading you'd like done on game startup
  _initImageData() async {
    await Flame.images.loadAll(<String>[
      'player_character.png'
    ]);
  }

  GameModel() {
    this._game = _MainGame();
    _initImageData();
  }

  Widget widget() {
    return _game.widget;
  }

}

class _MainGame extends Game {

  Size _screenSize;

  @override
  void resize(Size size) {
    this._screenSize = size;
    super.resize(size);
  }

  @override
  void update(double t) {

  }

  @override
  void render(Canvas canvas) {

  }
}