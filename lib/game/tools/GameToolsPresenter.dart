import 'package:async/async.dart';
import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/tools/GameToolsView.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';
import 'dart:async';

abstract class GameToolsPresenter {

}

class DefaultGameToolsPresenter extends GameToolsPresenter {

  GameToolsView _view;

  DefaultGameToolsPresenter(this._view);


}