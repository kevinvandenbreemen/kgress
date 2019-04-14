import 'package:flutter/widgets.dart';
import 'package:kevin_gamify/game/MainGame.dart';
import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';
import 'package:kevin_gamify/game/components/buttons/ControlArea.dart';
import 'package:kevin_gamify/game/components/speech/SpeechArea.dart';
import 'package:kevin_gamify/game/controller/area_controller.dart';
import 'package:kevin_gamify/game/controller/element_controllers.dart';

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

  void gotoArea(Area area, BuildContext context) {
    _state.setCurrentArea(area);
  }
}

class _GameWorldWidgetState extends State<GameWorldWidget> {

  Area currentArea;

  _GameWorldWidgetState(this.currentArea);

  void setCurrentArea(Area area) => setState(()=>currentArea = area);

  @override
  Widget build(BuildContext context) {

    SpeechArea speechArea = SpeechArea();

    AreaController areaController = AreaController(
        controllerRepository: widget._elementControllersRepository,
        area: currentArea,
        gameSettings: widget._gameSettings
    );

    GameModel model = GameModel(
        speechCallback: (String toSay) => speechArea.setText(toSay),
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