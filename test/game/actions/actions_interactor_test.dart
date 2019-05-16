import 'package:kevin_gamify/game/MainGame.dart';
import 'package:kevin_gamify/game/actions/actions_interactor.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';
import 'package:test/test.dart';

import '../controller/mock_area_controller.dart';

void main() {

  group("Initializing", () {

    test("Constructs okay", () {
      ActionsInteractor interactor = ActionsInteractor(GameModel(currentArea: MockAreaController(), settings: GameSettings(5), speechCallback: (toSay){}));
    });

  });

  group("Awaiters", () {



  });

}