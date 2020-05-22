import 'package:flutter_test/flutter_test.dart';

void main() {
  test("test my unit test", () {
    var result = 99;
    expect(result, 99);
    expect(result, 100);
  });
}
