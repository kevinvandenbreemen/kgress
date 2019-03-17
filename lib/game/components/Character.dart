import 'dart:ui';
import 'package:kevin_gamify/game/MainGame.dart';

/// Any person/enemy/whatever that moves around on the screen
class Character {

  /// Position and dimensions of this character on the screen
  Rect _characterRect;

  /// Reference to the game this character is inside of
  GameModel _gameModel;

  /// For rendering our character
  Paint _paint;

  /// Create character inside the given game.
  Character(this._gameModel, double x, double y) {
    this._characterRect = Rect.fromLTWH(x, y, _gameModel.tileSize(), _gameModel.tileSize());
    this._paint = Paint();
    _paint.color = Color(0xff6ab04c);
  }

  void render(Canvas canvas) {
    canvas.drawRect(_characterRect, _paint);
  }

  void update(double t) {

  }

}