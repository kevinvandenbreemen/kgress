import 'package:kevin_gamify/example/drawers/ExampleElementDrawerRepository.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';

import 'example_areas.dart';

GameCartridge exampleGame = GameCartridge(
  areas: List.from([
    exampleArea,
    mainArea,
    trainingArea
  ]),
  elementDrawerRepo: ExampleElementDrawerRepository()
);