import 'package:kgress/example/drawers/ExampleElementDrawerRepository.dart';
import 'package:kgress/game/cartridge/GameCartridge.dart';

import 'example_areas.dart';

GameCartridge exampleGame = GameCartridge(
  areas: List.from([
    exampleArea,
    mainArea,
    trainingArea
  ]),
  elementDrawerRepo: ExampleElementDrawerRepository()
);