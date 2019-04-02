import 'package:kevin_gamify/game/states/states.dart' as states;

/// Set of states that an object/character/etc could be in in the game
class StateSpace {

  final List<states.State> states;

  StateSpace(this.states);

}

/// States for a stationary, unmoving object
StateSpace stationary = StateSpace([states.stationary]);