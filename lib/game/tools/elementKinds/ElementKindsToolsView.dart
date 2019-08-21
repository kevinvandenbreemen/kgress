import 'package:kgress/game/areas/model/Area.dart';
import 'package:kgress/game/cartridge/GameCartridge.dart';
import 'package:kgress/game/controller/element_controllers.dart';
import 'package:kgress/game/elements/element_kinds.dart';
import 'package:kgress/game/imagesets/element_drawers.dart';
import 'package:kgress/game/states/states.dart';

mixin ElementKindsToolsView {

  /// Set the element kinds that can be selected on this screen
  void setElementKinds(List<ElementKind> kinds);

  /// Configure the game settings for display of game elements
  void setGameSettings(GameSettings settings);

  /// Display the selected element kind
  void showElementKind(Area area, ElementControllerRepository elementControllerRepository, List<State> states);

  /// Configure element drawer repository for use in rendering
  void setElementDrawerRepository(ElementDrawerRepository elementDrawerRepository);

}