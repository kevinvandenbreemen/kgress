import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';
import 'package:kevin_gamify/game/elements/element_kinds.dart';
import 'package:kevin_gamify/game/tools/elementKinds/ElementKindsToolsInteractor.dart';

import 'ElementKindsToolsPresenter.dart';
import 'ElementKindsToolsView.dart';

mixin ElementKindsToolsPresenterProvider {

  ElementKindsToolsPresenter getPresenter({ElementKindsToolsView view, List<ElementKind> elementKinds, GameCartridge gameCartridge});

}

class DefaultElementKindsToolsPresenterProvider with ElementKindsToolsPresenterProvider {
  @override
  ElementKindsToolsPresenter getPresenter({ElementKindsToolsView view, List<ElementKind> elementKinds, GameCartridge gameCartridge}) {
    return DefaultElementKindsToolsPresenter(view, ElementKindsToolsInteractor(elementKinds), gameCartridge);
  }

}