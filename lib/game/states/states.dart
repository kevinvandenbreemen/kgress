/// State that an object in the game can be in
class State  {

  final String _name;

  State(this._name);

  String get name => _name;

}

final State stationary = State("Stationary");
final State movingUp = State("Moving Up");
final State movingDown = State("Moving Down");
final State movingLeft = State("Moving Left");
final State movingRight = State("Moving Right");