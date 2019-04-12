import 'package:kevin_gamify/game/elements/element.dart';
import 'package:kevin_gamify/game/elements/element_kinds.dart';
import 'package:kevin_gamify/game/imagesets/element_drawers.dart';
import 'package:kevin_gamify/game/states/states.dart';

class ExampleElementDrawerRepository with ElementDrawerRepository {
  @override
  ElementDrawer getDrawer(Element element) {
    if(element.kind is StationaryObjectKind) {
      return SingleImageElementDrawer(element.kind.statesToImageSets[stationary]);
    }
    else if (element.kind is StatefulObjectKind) {
      return StatefulAnimatedImageElementDrawer(statesToImageSets: element.kind.statesToImageSets);
    }
  }

}