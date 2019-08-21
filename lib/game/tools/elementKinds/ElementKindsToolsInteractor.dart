import 'package:kgress/game/elements/element_kinds.dart';

class ElementKindsToolsInteractor {


  List<ElementKind> _elementKinds;


  ElementKindsToolsInteractor(this._elementKinds);

  List<ElementKind> getElementKinds() {
    return List.unmodifiable(_elementKinds);
  }

}