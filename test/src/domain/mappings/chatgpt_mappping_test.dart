import 'package:flutter_chatgpt/src/domain/mappings/chatgpt_mappping.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("ChatgptMapping", () {
    group("randomString()", () {
      test("should be not null", () {
        var mapping = ChatgptMapping();
        var id = mapping.randomString();
        expect(id, isNotNull);
      });

      test("should have a length = 24", () {
        var mapping = ChatgptMapping();
        var id = mapping.randomString();
        expect(id.length, 24);
      });
    });

    group("createSystemMessage()", () { 
      test("should be not null", () {
        var mapping = ChatgptMapping();
        var message = mapping.createSystemMessage("Hello");
        expect(message, isNotNull);
      });

      test("should have a text = Hello", () {
        var mapping = ChatgptMapping();
        var message = mapping.createSystemMessage("Hello");
        expect(message.text, "Hello");
      });
    
    });
  });
}
