import 'dart:ui';
import 'package:Sporten_in_de_buurt/screens/preferenceScreen.dart';
import 'package:Sporten_in_de_buurt/screens/screen.dart';
import 'package:Sporten_in_de_buurt/screens/loginscreen.dart';
import 'package:Sporten_in_de_buurt/screens/signupscreen.dart';
import 'package:Sporten_in_de_buurt/screens/sportlist.dart';
import 'package:Sporten_in_de_buurt/sport/calendar_popup_view.dart';
import 'package:Sporten_in_de_buurt/sport/sport_homenavigation.dart';
import 'package:Sporten_in_de_buurt/sport/sport_list_view.dart';
import 'package:Sporten_in_de_buurt/sport/model/sport_list_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'sport_app_theme.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class SportHomeScreen extends StatefulWidget {
  @override
  _SportHomeScreenState createState() => _SportHomeScreenState();
}

//Navigation options [0] is always left [1] is mid and [2] is right
//to get a 4th one or more in navigation you can easily add a new one underneath PreferenceScreen(),
final _pageOptions = [

  SportHomeScreenTwo(),
  Loginscreen(),
  PreferenceScreen(),

];

//state for screen
class _SportHomeScreenState extends State<SportHomeScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;
  List<SportListData> sportList = SportListData.sportList;
  final ScrollController _scrollController = ScrollController();

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));
  int selectedPage = 0;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }


  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  //Homepage with navigation menu
  @override
  Widget build(BuildContext context) {


    return Theme(
      data: SportAppTheme.buildLightTheme(),
      child: Container(

        child: Scaffold(
         body: _pageOptions[selectedPage],

          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), title: Text('Home')),
              BottomNavigationBarItem(icon: Icon(Icons.mail, size: 30), title: Text('Notificaties')),
              BottomNavigationBarItem(icon: Icon(Icons.account_circle, size: 30), title: Text('Profiel')),

            ],
            selectedItemColor: Colors.blueGrey,
            elevation: 5.0,
            unselectedItemColor: Colors.blueGrey[900],
            currentIndex: selectedPage,
            backgroundColor: Colors.white,
            onTap: (index){
              setState(() {
                selectedPage = index;
              });
            },
          ),

        ),

      ),
    );
  }

  //homepage list cards
  Widget getListUI() {
    return Container(
      decoration: BoxDecoration(
        color: SportAppTheme.buildLightTheme().backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, -2),
              blurRadius: 8.0),
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 156 - 50,
            child: FutureBuilder<bool>(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (!snapshot.hasData) {
                  return const SizedBox();
                } else {
                  return ListView.builder(
                    itemCount: sportList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      final int count =
                          sportList.length > 10 ? 10 : sportList.length;
                      final Animation<double> animation =
                          Tween<double>(begin: 0.0, end: 1.0).animate(
                              CurvedAnimation(
                                  parent: animationController,
                                  curve: Interval((1 / count) * index, 1.0,
                                      curve: Curves.fastOutSlowIn)));
                      animationController.forward();

                      return SportListView(
                        callback: () {},
                        sportData: sportList[index],
                        animation: animation,
                        animationController: animationController,
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  //retrieve all data from sport list and put it inside cards
  Widget getSportViewList() {
    final List<Widget> sportListViews = <Widget>[];
    for (int i = 0; i < sportList.length; i++) {
      final int count = sportList.length;
      final Animation<double> animation =
          Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Interval((1 / count) * i, 1.0, curve: Curves.fastOutSlowIn),
        ),
      );
      sportListViews.add(
        SportListView(
          callback: () {},
          sportData: sportList[i],
          animation: animation,
          animationController: animationController,
        ),
      );
    }
    animationController.forward();
    return Column(
      children: sportListViews,
    );
  }
//display current time for Calendar
  Widget getTimeDateUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 18, bottom: 16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      // setState(() {
                      //   isDatePopupOpen = true;
                      // });
                      showDemoDialog(context: context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 4, bottom: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Kies datum',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                color: Colors.black.withOpacity(1)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            '${DateFormat("dd MMM").format(startDate)} - ${DateFormat("dd MMM").format(endDate)}',
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              width: 1,
              height: 42,
              color: Colors.grey.withOpacity(0.8),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,

                    splashColor: Colors.grey.withOpacity(0.2),

                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MySportListView()));

                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 4, bottom: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Sport categorie',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                color: Colors.black.withOpacity(1)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Dropdown menu hier!',
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //sport category show filter at homepage (W.I.P)
  void showOptions(BuildContext context){
    var _myActivities;
    showDialog<dynamic>(
      context: context,
      child: MultiSelectFormField(
        autovalidate: false,
        fillColor: Colors.transparent,
        chipBackGroundColor: Colors.green,
        chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
        checkBoxActiveColor: Colors.green,
        checkBoxCheckColor: Colors.white,
        dialogShapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        title: Text(
          "Activiteiten",
          style: TextStyle(fontSize: 16),
        ),
        validator: (value) {
          if (value == null || value.length == 0) {
            return 'Kies één of meerdere opties';
          }
          return null;
        },
        dataSource: [
          {
            "display": "Hardlopen",
            "value": "Hardlopen",
          },
          {
            "display": "Tennis",
            "value": "tennis",
          },
          {
            "display": "Voetbal",
            "value": "Voetbal",
          },
          {
            "display": "Basketbal",
            "value": "Basketbal",
          },
          {
            "display": "Softbal",
            "value": "Softbal",
          },
        ],
        textField: 'display',
        valueField: 'value',
        okButtonLabel: 'Verder',
        cancelButtonLabel: 'Stop',
        hintWidget: Text('Kies minimaal één'),
        initialValue: _myActivities,
        onSaved: (value) {
          if (value == null) return;
          setState(() {
            _myActivities = value;
          });
          // _saveForm();
        },
      // ),
      ),
    );
  }

  //Calender pop up
  void showDemoDialog({BuildContext context}) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => CalendarPopupView(
        barrierDismissible: true,
        minimumDate: DateTime.now(),
        //  maximumDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 10),
        initialEndDate: endDate,
        initialStartDate: startDate,
        onApplyClick: (DateTime startData, DateTime endData) {
          setState(() {
            if (startData != null && endData != null) {
              startDate = startData;
              endDate = endData;
            }
          });
        },
        onCancelClick: () {},
      ),
    );
  }

  Widget getAppBarUI() {
    return Container(
      decoration: BoxDecoration(
        color: SportAppTheme.buildLightTheme().backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 2),
              blurRadius: 8.0),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, left: 8, right: 8),
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.sports),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Sporten app',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Container(
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[

                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(32.0),
                      ),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(FontAwesomeIcons.mapMarkerAlt),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ContestTabHeader extends SliverPersistentHeaderDelegate {
  ContestTabHeader(
    this.searchUI,
  );
  final Widget searchUI;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return searchUI;
  }

  @override
  double get maxExtent => 52.0;

  @override
  double get minExtent => 52.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
