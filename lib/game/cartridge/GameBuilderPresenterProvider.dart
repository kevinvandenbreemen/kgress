import 'package:kevin_gamify/game/cartridge/GameBuilderPresenter.dart';
import 'package:kevin_gamify/game/cartridge/GameBuilderView.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';

abstract class GameBuilderPresenterProvider {

  GameBuilderPresenter get(GameCartridge game, GameBuilderView view);

}

class DefaultGameBuilderPresenterProvider extends GameBuilderPresenterProvider {

  @override
  GameBuilderPresenter get(GameCartridge game, GameBuilderView view) {
    return DefaultGameBuilderPresenter(view, GameCartridgeForEdit(game));
  }

}