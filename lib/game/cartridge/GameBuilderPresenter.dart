import 'package:async/async.dart';
import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/cartridge/GameBuilderView.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';
import 'dart:async';

abstract class GameBuilderPresenter {

  Future<Result> addArea(Area area);

}

class DefaultGameBuilderPresenter extends GameBuilderPresenter {

  GameBuilderView _view;

  GameCartridgeForEdit _gameCartridgeForEdit;

  DefaultGameBuilderPresenter(this._view, this._gameCartridgeForEdit);

  @override
  Future<Result> addArea(Area area) {

    if(area.size == null || area.size == 0.0) {
      return Future.value(Result.error("Please specify size"));
    }

    return Future.value(
      Result.value("")
    );
  }


}