import 'package:kevin_gamify/game/components/Direction.dart';
import 'package:test/test.dart';
import 'dart:ui';

void main() {

  group("Direction Compute from Offset", () {
    test("Translates direction for offset to the right", () {
      Offset offset = Offset(10, 0);

      Direction direction = Directions.forOffset(offset);
      expect(direction, equals(Direction.right));
    });
    test("Translates direction for offset to the left", (){
      Offset offset = Offset(-9, 0);

      Direction direction = Directions.forOffset(offset);
      expect(direction, equals(Direction.left));
    });
  });

  group('Directions Computation', (){
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

    test("Size of boxes has no effect on calculation", () {
      Rect r1 = Rect.fromLTRB(1.0, 1.0, 3.0, 22.0);
      Rect r2 = Rect.fromLTRB(1.0, 2, -100, 6);

      Direction direction = Directions.of(from: r1, to: r2);

      expect(direction, equals(Direction.up));
    });

    test("Handles direction other than ltrb", () {

      Rect r1 = Rect.fromCircle(center: Offset(1.0, 1.0), radius: 1.0);
      Rect r2 = Rect.fromCircle(center: Offset(5.0, 10.0), radius: 1.0);

      Direction direction = Directions.of(from: r1, to: r2);
    });
  });

  group("Directions Convenience Methods", () {
    test("Opposite of left is right", () {

      Direction from = Direction.left;
      expect(Directions.opposite(of: from), equals(Direction.right));

    });

    test("Opposite of right is left", () {
      Direction from = Direction.right;
      expect(Directions.opposite(of: from), equals(Direction.left));
    });

    test("Opposite of up is down", () {
      Direction from = Direction.up;
      expect(Directions.opposite(of: from), equals(Direction.down));
    });

    test("Opposite of down is up", () {
      Direction from = Direction.down;
      expect(Directions.opposite(of: from), Direction.up);
    });

    test("Opposite of stationary is stationary", () {
      expect(Directions.opposite(of: Direction.stationary), equals(Direction.stationary));
    });

    test("Delta left is negative", () {
      double delta = 3.0;
      expect(Directions.delta(d: delta, direction: Direction.left), equals(-3.0));
    });

    test("Delta right is positive", () {
      double delta = 3.0;
      expect(Directions.delta(d: delta, direction: Direction.right), equals(3.0));
    });

  });

}