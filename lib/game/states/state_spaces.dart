import 'package:kevin_gamify/game/states/states.dart' as States;

/// Set of states that an object/character/etc could be in in the game
class StateSpace {

  final List<States.State> states;

  StateSpace(this.states);

}

/// States for a stationary, unmoving object
StateSpace stationary = StateSpace([States.stationary]);