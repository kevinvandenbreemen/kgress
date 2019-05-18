import 'package:kevin_gamify/game/actions/action.dart';
import 'package:kevin_gamify/game/elements/element.dart';

abstract class ElementAction extends Action {

  Element _element;

  Element get element => _element;

  void setElement(Element element) {
    this._element = element;
    onUpdateElement(this.element);
  }

  void onUpdateElement(Element element);

}