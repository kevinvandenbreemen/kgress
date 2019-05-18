import '../action.dart';

/// Action that holds up execution until some condition has occurred.
class Await implements Action {

  bool _isComplete = false;

  void update() {
    _isComplete = true;
  }

  @override
  bool isComplete() {
    return _isComplete;
  }

  @override
  void act() {

  }


}