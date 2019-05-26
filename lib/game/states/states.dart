import 'package:kevin_gamify/game/components/Direction.dart';

/// State that an object in the game can be in
class State  {

  final String _name;

  State(this._name);

  @override
  String toString() {
    return _name;
  }

  String get name => _name;

}

final State stationary = State("Stationary");
final State movingUp = State("Moving Up");
final State movingDown = State("Moving Down");
final State movingLeft = State("Moving Left");
final State movingRight = State("Moving Right");

State fromDirection(Direction direction) {
  switch(direction) {
    case Direction.up:
      return movingUp;
    case Direction.down:
      return movingDown;
    case Direction.left:
      return movingLeft;
    case Direction.right:
      return movingRight;
    case Direction.stationary:
      return stationary;
    default:
      return null;
  }
}

/// Gets the most appropriate direction from the given state
Direction fromState(State state) {

  if(state == movingRight) {
    return Direction.right;
  } else if (state == movingLeft) {
    return Direction.left;
  } else if (state == movingUp) {
    return Direction.up;
  } else if (state == movingDown) {
    return Direction.down;
  } else if (state == stationary) {
    return Direction.stationary;
  }

  return null;

}