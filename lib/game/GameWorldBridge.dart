/// Bridge that allows a subsystem such as an actor to perform actions like displaying text up at the level of the game world view
/// the player has.
abstract class GameWorldBridge {

  void say(String text);

}