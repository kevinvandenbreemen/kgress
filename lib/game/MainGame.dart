import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:kgress/game/cartridge/GameCartridge.dart';
import 'package:kgress/game/components/buttons/ControlsDelegate.dart';
import 'package:kgress/game/components/images/ImageRepository.dart';
import 'package:kgress/game/controller/area_controller.dart';

import 'GameWorldBridge.dart';
import 'components/Direction.dart';

/// Model of the game.
class GameModel with ControlsDelegate implements GameWorldBridge {

  AreaController _currentArea;
  AreaController get areaController => _currentArea;
  GameWorldBridge _gameWorldBridge;
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

  GameModel({GameWorldBridge gameWorldBridge, GameSettings settings, AreaController currentArea}) {
    this._currentArea = currentArea;

    if(gameWorldBridge != null) {
      this._gameWorldBridge = gameWorldBridge;
    } else {
      this._gameWorldBridge = DummyGameWorldBridge();
    }

    _initImageData();

  }

  ImageRepository images() {
    return _imageRepository;
  }

  @override
  void say(String text) {
    _gameWorldBridge.say(text);
  }

  void _updatePlayerDirection(Direction direction) {
    _currentArea.updateDirection(direction);
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

  GameModel _model;

  MainGame(this._model){
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
    super.resize(size);
  }

  @override
  void update(double t) {
    _model.areaController.update(t);
  }

  @override
  void render(Canvas canvas) {
    _model.areaController.render(canvas, _screenSize);
  }

  void onTapDown(TapDownDetails details) {

  }

}