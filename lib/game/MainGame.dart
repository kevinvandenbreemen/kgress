import 'package:flame/game.dart';
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flame/flame.dart';
import 'package:kevin_gamify/game/components/Character.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/util.dart';

/// Model of the game.
class GameModel {

  _MainGame _game;

  List<Character> _characters;

  /// Add any image pre-loading you'd like done on game startup
  _initImageData() async {
    await Flame.images.loadAll(<String>[
      'player_character.png'
    ]);
  }

  /// Force a resize call on the game engine so that tile/screen size can be set
  void _initScreenDim() async {
    _game.resize(await Flame.util.initialDimensions());
    _stupidMethodThatShouldBeMoved();
  }

  GameModel() {
    this._game = _MainGame();
    _game._model = this;
    this._characters = List<Character>();

    _initImageData();
    _initScreenDim();

  }

  Widget widget() {
    return _game.widget;
  }

  double tileSize() {
    return _game._tileSize;
  }


  _stupidMethodThatShouldBeMoved() {
    _characters.add(Character(this, 50, 100));
  }

}

class _MainGame extends Game {

  Size _screenSize;

  /// Size of a square "tile" on the screen assuming the width of the screen is something like 9x16
  double _tileSize;

  GameModel _model;

  _MainGame(){
    Util flameUtil = Util();
    TapGestureRecognizer tapper = TapGestureRecognizer();
    tapper.onTapDown = onTapDown;
    flameUtil.addGestureRecognizer(tapper);
  }

  @override
  void resize(Size size) {
    this._screenSize = size;
    this._tileSize = _screenSize.width / 9.0;
    super.resize(size);
  }

  @override
  void update(double t) {
    _model._characters.forEach((character)=>character.update(t));
  }

  @override
  void render(Canvas canvas) {
    _model._characters.forEach((character)=>character.render(canvas));
  }

  void onTapDown(TapDownDetails details) {
    print("Tapsped - $details");
  }

}