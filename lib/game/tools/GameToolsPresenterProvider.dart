import 'package:kgress/game/cartridge/GameCartridge.dart';
import 'package:kgress/game/tools/GameToolsPresenter.dart';
import 'package:kgress/game/tools/GameToolsView.dart';
import 'package:kgress/game/tools/area/area_interactor.dart';

abstract class GameToolsPresenterProvider {

  GameToolsPresenter get(GameToolsView view);

}

class DefaultGameToolsPresenterProvider extends GameToolsPresenterProvider {

  GameCartridge _game;

  DefaultGameToolsPresenterProvider(this._game);

  @override
  GameToolsPresenter get(GameToolsView view) {
    return DefaultGameToolsPresenter(
        view,
        AreaInteractor(game: _game)
    );
  }

}