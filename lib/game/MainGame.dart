import 'package:flame/game.dart';
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flame/flame.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';
import 'package:kevin_gamify/game/components/Character.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/util.dart';
import 'components/controllers/PlayerController.dart';
import 'package:kevin_gamify/game/components/images/ImageRepository.dart';
import 'package:kevin_gamify/game/components/buttons/ControlsDelegate.dart';
import 'components/Direction.dart';

/// Model of the game.
class GameModel with ControlsDelegate {

  _MainGame _game;

  List<Character> _characters;

  Function _onSay;

  ImageRepository _imageRepository;

  /// Main controller to feed user input into
  PlayerController _playerController;

  /// Add any image pre-loading you'd like done on game startup
  _initImageData() async {
    await Flame.images.loadAll(<String>[
      'player_character.png',
      'arrows.png',
      'arrow_left.png',
      'arrow_down.png',
      'arrow_right.png',
      'arrow_up.png',
    ]);

    _imageRepository = ImageRepository();
  }

  /// Force a resize call on the game engine so that tile/screen size can be set
  void _initScreenDim() async {
    _game.resize(await Flame.util.initialDimensions());
    _stupidMethodThatShouldBeMoved();
  }

  GameModel({Function speechCallback, GameSettings settings}) {
    this._game = _MainGame(settings);
    _game._model = this;
    this._characters = List<Character>();
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

  _stupidMethodThatShouldBeMoved() {
    Character c = Character(this, 50, 300);
    //c.setController(BackAndForthController(c, 1.0, 300));
    _playerController = PlayerController(character: c, speed: 1.0);
    c.setController(_playerController);
    _characters.add(c);
  }

  void say(String text) {
    if(_onSay != null) {
      _onSay(text);
    }
  }

  void _updatePlayerDirection(Direction direction) {
    _playerController.setDirection(direction);
  }

  @override
  void onPressedRight() {
    debugPrint("Right");
    _updatePlayerDirection(Direction.right);
  }

  @override
  void onPressedLeft() {
    debugPrint("Left");
    _updatePlayerDirection(Direction.left);
  }

  @override
  void onPressedDown() {
    debugPrint("Down");
    _updatePlayerDirection(Direction.down);
  }

  @override
  void onPressedUp() {
    debugPrint("Up");
    _updatePlayerDirection(Direction.up);
  }

  @override
  void onRelease() {
    debugPrint("Stationary");
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
    _model._characters.forEach((character)=>character.update(t));
  }

  @override
  void render(Canvas canvas) {
    _model._characters.forEach((character)=>character.render(canvas));
  }

  void onTapDown(TapDownDetails details) {
    debugPrint("Tapsped - $details");
  }

}