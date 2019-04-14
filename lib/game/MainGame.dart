import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';
import 'package:kevin_gamify/game/components/buttons/ControlsDelegate.dart';
import 'package:kevin_gamify/game/components/images/ImageRepository.dart';
import 'package:kevin_gamify/game/controller/area_controller.dart';

import 'components/Direction.dart';

/// Model of the game.
class GameModel with ControlsDelegate {

  AreaController currentArea;

  Function _onSay;

  ImageRepository _imageRepository;

  /// Add any image pre-loading you'd like done on game startup
  _initImageData() async {
    await Flame.images.loadAll(<String>[
      'player_character.png',
      'arrows.png',
      'arrow_left.png',
      'arrow_down.png',
      'arrow_right.png',
      'arrow_up.png'
    ]);

    _imageRepository = ImageRepository();
  }

  GameModel({Function speechCallback, GameSettings settings, AreaController currentArea}) {
    this.currentArea = currentArea;
    this._onSay = speechCallback;

    _initImageData();

  }

  ImageRepository images() {
    return _imageRepository;
  }

  void say(String text) {
    if(_onSay != null) {
      _onSay(text);
    }
  }

  void _updatePlayerDirection(Direction direction) {
    currentArea.updateDirection(direction);
  }

  @override
  void onPressedRight() {
    _updatePlayerDirection(Direction.right);
  }

  @override
  void onPressedLeft() {
    _updatePlayerDirection(Direction.left);
  }

  @override
  void onPressedDown() {
    _updatePlayerDirection(Direction.down);
  }

  @override
  void onPressedUp() {
    _updatePlayerDirection(Direction.up);
  }

  @override
  void onRelease() {
    _updatePlayerDirection(Direction.stationary);
  }


}

/// Game itself (tie-in with the Flame engine).  This is different from the [GameModel].
class MainGame extends Game {

  Size _screenSize;

  /// Size of a square "tile" on the screen assuming the width of the screen is something like 9x16
  double _tileSizeOnScreen;

  GameModel _model;

  GameSettings _gameSettings;

  MainGame(this._gameSettings, this._model){
    Util flameUtil = Util();
    TapGestureRecognizer tapper = TapGestureRecognizer();
    tapper.onTapDown = onTapDown;
    flameUtil.addGestureRecognizer(tapper);
    _init();
  }

  void _init() async {
    resize(await Flame.util.initialDimensions());
  }

  @override
  void resize(Size size) {
    this._screenSize = size;
    this._tileSizeOnScreen = _screenSize.width / _gameSettings.tileWidthsPerScreen;
    super.resize(size);
  }

  @override
  void update(double t) {
    _model.currentArea.update(t);
  }

  @override
  void render(Canvas canvas) {
    _model.currentArea.render(canvas, _screenSize);
  }

  void onTapDown(TapDownDetails details) {

  }

}