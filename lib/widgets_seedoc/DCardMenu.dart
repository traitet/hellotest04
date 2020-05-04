import 'package:flutter/material.dart';
import 'package:hellotest04/screens_seedoc/DSearchDocPage.dart';
import 'package:hellotest04/screens_seedoc/DViewDocPage.dart';
import 'package:hellotest04/screens_seedoc/DCreateDocPage.dart';
import 'package:hellotest04/screens_seedoc/DLoginPage.dart';
// import 'package:hellotest04/screens_seedoc/DSignUpPage.dart';
import 'package:hellotest04/screens_seedoc/DDocFlowSetup.dart';
import 'package:hellotest04/screens_seedoc/DEditProfilePage.dart';
//import 'package:hellotest04/services/LoggerService.dart';

class DCardMenu extends StatefulWidget {
  @override
  _DCardMenuState createState() => _DCardMenuState();
}


class _DCardMenuState extends State<DCardMenu> {
  @override
  Widget build(BuildContext context) {
//===========================================================
// RETURN CONTAINER AND PUT IN SCAFFOLD IN MENU PAGE
//===========================================================
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
      child: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(3.0),
        children: <Widget>[
          makeDashboardItem(context, "Create Document", Icons.book,
              MaterialPageRoute(builder: (context) => DCreateDocPage())),
          makeDashboardItem(context, "Doc Flow Setup", Icons.settings,
              MaterialPageRoute(builder: (context) => DDocFlowSetupPage())),              
          makeDashboardItem(context, "View Document", Icons.view_list,
              MaterialPageRoute(builder: (context) => DViewDocPage())),
          makeDashboardItem(context, "Search Document", Icons.search,
              MaterialPageRoute(builder: (context) => DSearchDocPage())),
          makeDashboardItem(context, "Profile", Icons.verified_user,
              MaterialPageRoute(builder: (context) => DEditProfilePage())),
          makeDashboardItem(context, "Logout", Icons.exit_to_app,
              MaterialPageRoute(builder: (context) => DLoginPage())),
        ],
      ),
    );
  }
}

//===========================================================
// 5) FUNCTION TO MAKE DASHBOARD
//===========================================================
Card makeDashboardItem(
  BuildContext myContext,
  String title,
  IconData icon,
  MaterialPageRoute myRoute,
) {
  //=======================================================
  // 1) RETURN CARD
  //=======================================================
  return Card(
      elevation: 1.0,
      margin: new EdgeInsets.all(8.0),
      //===================================================
      // 2) CHILD: CONTAINER
      //===================================================
      child: Container(
        //=======================================================
        // 3) SIZE
        //=======================================================
        decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
        child: new InkWell(
          onTap: () {
            Navigator.push(myContext, myRoute);
          },
          child: Column(
            //=======================================================
            //4) MENU (ICON AND TEXT)
            //=======================================================
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 50.0),
              //=======================================================
              // 5) ICON
              //=======================================================
              Center(
                child: Icon(
                icon,
                size: 40.0,
                color: Colors.black,
              )),
              SizedBox(height: 20.0),
              //=======================================================
              // 5) TEXT
              //=======================================================
              Center(
                child: Text(title,
                    style: TextStyle(fontSize: 16.0, color: Colors.black)),
              )
            ],
          ),
        ),
      ));
}