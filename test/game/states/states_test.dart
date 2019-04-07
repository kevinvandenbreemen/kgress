import 'package:kevin_gamify/game/components/Direction.dart';
import 'package:test/test.dart';
import 'package:kevin_gamify/game/states/states.dart';

void main() {

  group("State from Direction", () {
    test("Computes main directions", (){

      expect(fromDirection(Direction.up), equals(movingUp));
      expect(fromDirection(Direction.down), equals(movingDown));
      expect(fromDirection(Direction.right), equals(movingRight));
      expect(fromDirection(Direction.left), equals(movingLeft));
      expect(fromDirection(Direction.stationary), equals(stationary));

    });
  });

}