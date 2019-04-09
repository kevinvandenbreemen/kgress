import 'package:async/async.dart';
import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/cartridge/GameBuilderView.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';
import 'dart:async';

abstract class GameBuilderPresenter {

}

class DefaultGameBuilderPresenter extends GameBuilderPresenter {

  GameBuilderView _view;

  DefaultGameBuilderPresenter(this._view);


}