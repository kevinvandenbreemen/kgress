import 'package:flutter/widgets.dart';
import 'package:kevin_gamify/game/GameWorldBridge.dart';
import 'package:kevin_gamify/game/MainGame.dart';
import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';
import 'package:kevin_gamify/game/components/buttons/ControlArea.dart';
import 'package:kevin_gamify/game/components/speech/SpeechArea.dart';
import 'package:kevin_gamify/game/controller/area_controller.dart';
import 'package:kevin_gamify/game/controller/element_controllers.dart';
import 'package:kevin_gamify/game/controller/element_controllers_repository_default.dart';

class GameWorldWidget extends StatefulWidget {

  _GameWorldWidgetState _state;

  ElementControllerRepository _elementControllersRepository;

  Area _currentArea;

  GameSettings _gameSettings;

  GameWorldWidget(this._elementControllersRepository,
      this._gameSettings, {Area currentArea}) {
    this._currentArea = currentArea;
  }

  @override
  _GameWorldWidgetState createState() {
    _state = _GameWorldWidgetState(_currentArea);
    return _state;
  }

  void gotoArea(Area area) {
    _state.setCurrentArea(area);
  }
}

/// Default bridge into the gameworld.  This type is intended for internal use only and is the goto implementation for bridging subsystems
/// such as the actions into the main gameworld view.
class _DefaultGameWorldBridge implements GameWorldBridge {

  Function(String) speechCallback;

  _DefaultGameWorldBridge(this.speechCallback);

  @override
  void say(String text) {
    speechCallback(text);
  }

}

class _GameWorldWidgetState extends State<GameWorldWidget> {

  Area currentArea;

  _GameWorldWidgetState(this.currentArea);

  void setCurrentArea(Area area) => setState(()=>currentArea = area);

  @override
  Widget build(BuildContext context) {

    SpeechArea speechArea = SpeechArea();
    GameWorldBridge bridge = _DefaultGameWorldBridge((String toSay) => speechArea.setText(toSay));

    if(widget._elementControllersRepository is DefaultElementControllersRepository) {
      (widget._elementControllersRepository as DefaultElementControllersRepository).gameWorld = bridge;
    }

    AreaController areaController = AreaController(
        controllerRepository: widget._elementControllersRepository,
        area: currentArea,
        gameSettings: widget._gameSettings
    );

    GameModel model = GameModel(
        gameWorldBridge: bridge,
        settings: widget._gameSettings,
        currentArea: areaController
    );

    MainGame mainGame = MainGame(model);

    return Stack(
      children: <Widget>[
        mainGame.widget,
        speechArea,
        ControlArea(model),
      ],
    );
  }
}