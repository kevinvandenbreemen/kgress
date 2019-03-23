
/// API for sending signal that user has pressed/used a control
mixin ControlsDelegate {

  void onPressedUp();

  void onPressedDown();

  void onPressedLeft();

  void onPressedRight();

  /// When user releases whatever direction they're holding
  void onRelease();

}