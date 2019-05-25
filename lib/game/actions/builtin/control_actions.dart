import 'package:kevin_gamify/game/actions/builtin/mixins.dart';

import '../action.dart';
import 'events.dart';

/// Specific section / delimiter of action sequence
class LabelAction extends Action {

  bool _complete = false;
  final String label;
  LabelAction(this.label);

  @override
  String toString() {
    return "LABEL:  $label";
  }

  @override
  void act() {
    _complete = true;
  }

  @override
  Action copy() {
    return (LabelAction(this.label));
  }

  @override
  bool isComplete() {
    return _complete;
  }

  @override
  void reset() {
    _complete = false;
  }

}

/// Tells the action system to go to label action and start from there
class Goto extends LabelAction {

  Function(String) callback;

  Goto(String label) : super(label);

  @override
  String toString() {
    return "GOTO $label";
  }

  @override
  void act() {
    if(callback != null){
      callback(label);
    }
    super.act();
  }

  @override
  void reset() {
    callback = null;
    super.reset();
  }

  @override
  Action copy() {
    return Goto(label);
  }

}

/// Action that specifies how the actor is to react to different events.  See also [Events]
class On extends Action with ValidatableAction {

  bool _complete = false;
  Function(Events, Action) callback;
  final Events event;
  final Action response;

  On(this.event, this.response);

  @override
  void act() {
    if(callback != null) {
      callback(event, response);
    }
    _complete = true;
  }

  @override
  Action copy() {
    return On(event, response);
  }

  @override
  bool isComplete() {
    return _complete;
  }

  @override
  void reset() {
    _complete = false;
    callback = null;
  }

  @override
  validate() {
    if(!(response is Goto)) {
      throw ArgumentError.value("Response must be a control action (in this case, a $Goto");
    }
  }

}
