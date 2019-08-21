import 'package:kgress/game/actions/builtin/Await.dart';
import 'package:test/test.dart';

void main() {

  group("Completing and Resettting", () {

    test("You can mark the await as complete using update()", () {
      Await await = Await();
      expect(await.isComplete(), isFalse);

      await.update();

      expect(await.isComplete(), isTrue);
    });

    test("Resetting marks the await as incomplete", () {
      Await await = Await();
      expect(await.isComplete(), isFalse);

      await.update();
      await.reset();

      expect(await.isComplete(), isFalse);
    });

  });

}