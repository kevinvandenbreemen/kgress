import 'package:kgress/game/actions/action.dart';
import 'package:kgress/game/elements/element.dart';

abstract class ElementAction extends Action {

  Element _element;

  Element get element => _element;

  void setElement(Element element) {
    this._element = element;
    onUpdateElement(this.element);
  }

  void onUpdateElement(Element element);

  @override
  void reset() {
    _element = null;
    onReset();
  }

  /// Perform any cleanup required for reset
  void onReset();

}