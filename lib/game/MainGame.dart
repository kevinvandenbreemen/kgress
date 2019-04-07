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

  _MainGame _game;

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

  /// Force a resize call on the game engine so that tile/screen size can be set
  void _initScreenDim() async {
    _game.resize(await Flame.util.initialDimensions());
  }

  GameModel({Function speechCallback, GameSettings settings, AreaController currentArea}) {
    this._game = _MainGame(settings);
    this.currentArea = currentArea;
    _game._model = this;
    this._onSay = speechCallback;

    _initImageData();
    _initScreenDim();

  }

  Widget widget() {
    return _game.widget;
  }

  double tileSize() {
    return _game._tileSizeOnScreen;
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
class _MainGame extends Game {

  Size _screenSize;

  /// Size of a square "tile" on the screen assuming the width of the screen is something like 9x16
  double _tileSizeOnScreen;

  GameModel _model;

  GameSettings _gameSettings;

  _MainGame(this._gameSettings){
    Util flameUtil = Util();
    TapGestureRecognizer tapper = TapGestureRecognizer();
    tapper.onTapDown = onTapDown;
    flameUtil.addGestureRecognizer(tapper);
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