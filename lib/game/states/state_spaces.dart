import 'package:kgress/game/states/states.dart' as States;

/// Set of states that an object/character/etc could be in in the game
class StateSpace {

  final List<States.State> states;

  StateSpace(this.states);

}

/// States for a stationary, unmoving object
StateSpace stationary = StateSpace([States.stationary]);

/// Set of states for something that moves in the four compass directions.  It is not
/// recommended that you use this space for a player character as it will prevent other
/// states (happy, sad, dead, etc) from being used!
StateSpace directional = StateSpace([
  States.stationary,
  States.movingUp,
  States.movingDown,
  States.movingLeft,
  States.movingRight
]);