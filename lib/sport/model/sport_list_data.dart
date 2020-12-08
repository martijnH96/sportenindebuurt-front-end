class SportListData {
  SportListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.perNight = "",
  });

  String imagePath;
  String titleTxt;
  String subTxt;
  String perNight;

  static List<SportListData> sportList = <SportListData>[
    SportListData(
      imagePath: 'assets/sport/voetbal.jpg',
      titleTxt: 'Voetbal Cruijff court',
      subTxt: 'Datum: 9 Dec 10:00 - 13:00',
      //hier nog de afstand weergeven
      perNight: "Naar event",
    ),
    SportListData(
      imagePath: 'assets/sport/tennis.jpg',
      titleTxt: 'Tennis tournooi',
      subTxt: 'Datum: 9 Dec 10:00 - 13:00',
      perNight: "Naar event",
    ),
    SportListData(
      imagePath: 'assets/sport/voetbal.jpg',
      titleTxt: 'Voetbal WSV veld',
      subTxt: 'Datum: 9 Dec 10:00 - 13:00',
      perNight: "Naar event",
    ),
    SportListData(
      imagePath: 'assets/sport/voetbal.jpg',
      titleTxt: 'Voetbal WSV veld',
      subTxt: 'Datum: 9 Dec 10:00 - 13:00',
      perNight: "Naar event",
    ),
    SportListData(
      imagePath: 'assets/sport/voetbal.jpg',
      titleTxt: 'Voetbal WSV veld',
      subTxt: 'Datum: 9 Dec 10:00 - 13:00',
      perNight: "Naar event",
    ),
  ];
}
