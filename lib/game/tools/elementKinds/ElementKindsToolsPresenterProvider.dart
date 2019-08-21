import 'package:kgress/game/cartridge/GameCartridge.dart';
import 'package:kgress/game/elements/element_kinds.dart';
import 'package:kgress/game/tools/elementKinds/ElementKindsToolsInteractor.dart';

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