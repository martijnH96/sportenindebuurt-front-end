import 'package:flutter_test/flutter_test.dart';
import 'package:Sporten_in_de_buurt/sportlist.dart';

void main() {
  group('Sportlist', () {
    test('Select a list', (){
      String geselecteerdeSport = 'voetbal';

      SelectSport selectSport = new SelectSport();

      expect(selectSport.sportSelect(geselecteerdeSport), {'Voetbal': false, 'Goals': false, 'Pionnen': false, 'Hesjes': false});

    });

    test('Select no list', (){
      String geselecteerdeSport = '';

      SelectSport selectSport = new SelectSport();

      expect(() => selectSport.sportSelect(geselecteerdeSport), throwsA(isInstanceOf<ArgumentError>()));
    });
  });
}
