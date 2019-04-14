import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';
import 'package:kevin_gamify/game/tools/GameToolsPresenter.dart';
import 'package:kevin_gamify/game/tools/GameToolsPresenterProvider.dart';
import 'package:kevin_gamify/game/tools/GameToolsView.dart';
import 'package:kevin_gamify/game/tools/designer/game_designer_character.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockGameToolsView extends Mock implements GameToolsView {

}

void main() {



  group("Go to Area", () {

    GameToolsView view;
    GameCartridge game;
    DefaultGameToolsPresenterProvider presenterProvider;

    setUp((){
      game = GameCartridge(areas: [Area(10, "Test Area"), Area(5, "Other Area")]);
      presenterProvider = DefaultGameToolsPresenterProvider(game);
      view = MockGameToolsView();
    });
    
    test("Goes to area", () {
      GameToolsPresenter presenter = presenterProvider.get(view);

      presenter.goToArea(game.areas[0], null);

      expect(game.areas[0].elements.where((element)=>element.kind == gameDesignerCharacter).toList().length, equals(1));
      verify(view.goToArea(game.areas[0], null));
    });

  });

}