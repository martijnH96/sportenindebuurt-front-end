import 'package:Sporten_in_de_buurt/materialsneeded.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('Remove', (){
    test('remove from array when all atributes are false', () {
      Map<String, bool> List = {
        'Voetbal': false,
        'Goals': false,
        'Water': false,
      };

      RemoveFromList removeFromList = new RemoveFromList();
      removeFromList.remove(List);

      expect(List, {'Voetbal': false, 'Goals': false, 'Water': false});
    });

    test('remove from array when an atribute is true', () {
      Map<String, bool> List = {
        'Voetbal': false,
        'Goals': true,
        'Water': false,
      };

      RemoveFromList removeFromList = new RemoveFromList();
      removeFromList.remove(List);

      expect(List, {'Voetbal': false, 'Water': false});
    });

    test('remove from array when all atributes are true', () {
      Map<String, bool> List = {
        'Voetbal': true,
        'Goals': true,
        'Water': true,
      };

      RemoveFromList removeFromList = new RemoveFromList();
      removeFromList.remove(List);

      expect(List, {});
    });
  });

}