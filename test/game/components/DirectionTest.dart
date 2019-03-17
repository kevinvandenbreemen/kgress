import 'package:kevin_gamify/game/components/Direction.dart';
import 'package:test/test.dart';
import 'dart:ui';

void main() {

  group('Directions', (){
    test("Translates direction based on point behind (to the left)", (){

      Rect r1 = Rect.fromLTRB(1.0, 1.0, 1.0, 1.0);
      Rect r2 = Rect.fromLTRB(2.0, 1, 1, 1);

      Direction direction = Directions.of(from: r2, to: r1);

      expect(direction, equals(Direction.left));

    });

    test("Translates direction based on point ahead (to the right)", () {
      Rect r1 = Rect.fromLTRB(1.0, 1.0, 1.0, 1.0);
      Rect r2 = Rect.fromLTRB(2.0, 1, 1, 1);

      Direction direction = Directions.of(from: r1, to: r2);

      expect(direction, equals(Direction.right));
    });

    test("Translates direction based on point above (upward)", () {
      Rect r1 = Rect.fromLTRB(1.0, 1.0, 1.0, 1.0);
      Rect r2 = Rect.fromLTRB(1.0, 2, 1, 1);

      Direction direction = Directions.of(from: r1, to: r2);

      expect(direction, equals(Direction.up));
    });

    test("Translates direction based on point below (downward)", (){
      Rect r1 = Rect.fromLTRB(1.0, 1.0, 1.0, 1.0);
      Rect r2 = Rect.fromLTRB(1.0, 2, 1, 1);

      Direction direction = Directions.of(from: r2, to: r1);

      expect(direction, equals(Direction.down));
    });

    test("Stationary if no delta", () {
      Rect r1 = Rect.fromLTRB(1.0, 1.0, 1.0, 1.0);
      Rect r2 = Rect.fromLTRB(1.0, 1.0, 1, 1);

      Direction direction = Directions.of(from: r2, to: r1);

      expect(direction, equals(Direction.stationary));
    });
  });

}