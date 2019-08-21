import 'package:kgress/game/elements/element.dart';
import 'package:kgress/game/elements/element_kinds.dart';
import 'package:kgress/game/imagesets/element_drawers.dart';
import 'package:kgress/game/states/states.dart';

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