

abstract class Action {

  bool isComplete();

  /// Do the action.  Note that if this is a long-running action this method will still
  /// be invoked and must be able to check whether the action is complete etc.
  void act();

  /// Reset action, clearing its state information
  void reset();

  Action copy();

}