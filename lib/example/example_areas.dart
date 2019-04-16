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

  AreaForEdit(mainArea).fill(decorativeTile);

  return mainArea;
}

Area buildTrainingArea() {
  Area trainingArea = Area(3, "Training Area");

  AreaForEdit(trainingArea).fillLocations(decorativeTile, [
    [1, 0, 1],
    [1, 0, 1],
    [1, 0, 1],
  ]).fillLocations(floorTile, [
    [0,0,0],
    [0,1,0],
    [0,0,0],
  ], layer: 1);



  return trainingArea;
}