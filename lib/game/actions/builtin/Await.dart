import '../action.dart';

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