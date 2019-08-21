import 'package:kgress/game/components/Direction.dart';
import 'package:kgress/game/states/states.dart';
import 'package:test/test.dart';

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