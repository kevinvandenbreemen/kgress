import 'package:kevin_gamify/example/images/example_image_sets.dart';
import 'package:kevin_gamify/example/kinds/example_kinds.dart';
import 'package:kevin_gamify/game/elements/element.dart';
import 'package:kevin_gamify/game/elements/element_kinds.dart';
import 'package:kevin_gamify/game/imagesets/element_drawers.dart';

class ExampleElementDrawerRepository with ElementDrawerRepository {
  @override
  ElementDrawer getDrawer(Element element) {
    if(element.kind == floorTile) {
      return SingleImageElementDrawer(greenTile);
    }
    else if (element.kind is StatefulObjectKind) {
      return StatefulAnimatedImageElementDrawer(statesToImageSets: element.kind.statesToImageSets);
    }
  }

}