import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';
import 'package:kevin_gamify/game/elements/element_kinds.dart';
import 'package:kevin_gamify/game/imagesets/element_drawers.dart';

mixin ElementKindsToolsView {

  /// Set the element kinds that can be selected on this screen
  void setElementKinds(List<ElementKind> kinds);

  /// Configure the game settings for display of game elements
  void setGameSettings(GameSettings settings);

  /// Display the selected element kind
  void showElementKind(ElementDrawerRepository elementDrawerRepository, Area area);

}