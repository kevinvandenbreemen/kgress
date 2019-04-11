import 'package:kevin_gamify/example/kinds/example_kinds.dart';
import 'package:kevin_gamify/game/areas/model/Area.dart';

Area exampleArea = buildExampleArea();
Area mainArea = buildMainArea();
Area trainingArea = buildTrainingArea();

Area buildExampleArea() {
  Area currentArea = Area(10, "Test Area");

  AreaForEdit editor = AreaForEdit(currentArea);
  editor.fill(floorTile, layer: 0);

  editor.add(decorativeTile, 0, 0);
  editor.add(decorativeTile, 4.5, 4.5);
  editor.add(decorativeTile, 0, 3);
  editor.add(decorativeTile, 2, 0);

  return currentArea;
}

Area buildMainArea() {
  Area mainArea = Area(15, "Main Area");
  return mainArea;
}

Area buildTrainingArea() {
  Area trainingArea = Area(15, "Training Area");
  return trainingArea;
}