import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/cartridge/GameBuilderPresenter.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';
import 'package:test/test.dart';

import 'TestGameBuilderView.dart';

void main() {

  GameCartridge cartridge;
  GameBuilderPresenter presenter = DefaultGameBuilderPresenter(TestGameBuilderView(), GameCartridgeForEdit(cartridge));
  
  group("Adding Area", () {

    test("Error if custom size not given", () {
      presenter.addArea(Area(null)).then(expectAsync1((result){
        expect(result.isError, isTrue);
        expect(result.asError.error, equals("Please specify size"));
      }));
    });

  });

}