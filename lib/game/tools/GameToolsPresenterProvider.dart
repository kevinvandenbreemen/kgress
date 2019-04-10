import 'package:kevin_gamify/game/tools/GameToolsPresenter.dart';
import 'package:kevin_gamify/game/tools/GameToolsView.dart';

abstract class GameToolsPresenterProvider {

  GameToolsPresenter get(GameToolsView view);

}

class DefaultGameToolsPresenterProvider extends GameToolsPresenterProvider {

  @override
  GameToolsPresenter get(GameToolsView view) {
    return DefaultGameToolsPresenter(view);
  }

}