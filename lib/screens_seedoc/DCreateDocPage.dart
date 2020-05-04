import 'package:flutter/material.dart';
import 'package:hellotest04/services/LoggerService.dart';
import 'package:hellotest04/services_seedoc/DNewDoc.dart';
import 'package:hellotest04/services/ShowNotification.dart';
import 'package:hellotest04/services_seedoc/DSubmitDoc.dart';

class DCreateDocPage extends StatefulWidget {
  DCreateDocPage({Key key}) : super(key: key);

  @override
  _DCreateDocPageState createState() => _DCreateDocPageState();
}

class _DCreateDocPageState extends State<DCreateDocPage> {
  //===================================================================================
  // 1) DECLARE VARIABLE
  //===================================================================================
  final _docIdController = TextEditingController()..text = "D2000001";    
  final _usernameController = TextEditingController()..text = "traitet";  
  final _docTitleController = TextEditingController()..text = "Petty Cash";
  
  @override
  Widget build(BuildContext context) {
    //========================================================
    // SCAFFOLD
    //========================================================
    return Scaffold(
      //======================================================
      // APP BAR
      //======================================================
      appBar: AppBar(
        title: Text("Create Doc"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.camera_alt), onPressed: fnScan)
        ],
      ),
      //======================================================
      // BUTTOM NAVIGATE BAR
      //======================================================
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 75,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              //===============================================
              // WIDGET:IMAGE BODY WIDGET
              //===============================================             
              columnButtomButtonBar(context, Icons.home, "Config"),
              columnButtomButtonBar(context, Icons.search, "Recall"),
              columnButtomButtonBar(context, Icons.send, "Submit"),
            ],
          ),
        ),
      ),
      //======================================================
      // BODY
      //======================================================     
      body: ListView(
        children: <Widget>[   
          //==========================================================================
          // BUILD WIDGET IMAGE AND TEXT
          //==========================================================================             
          widgetBodyImage(),
          widgetBodyText,
           //==========================================================================
          //INPUT DATA
          //==========================================================================       
          TextFormField(decoration: InputDecoration(labelText: 'Doc ID', prefixIcon: Icon(Icons.email)),controller: _docIdController),                
          TextFormField(decoration: InputDecoration(labelText: 'User Name', prefixIcon: Icon(Icons.email)),controller: _usernameController),
          TextFormField(decoration: InputDecoration(labelText: 'Doc Title', prefixIcon: Icon(Icons.security)),controller: _docTitleController),          
           //==========================================================================
          // 2) BUTTON
          //==========================================================================    
          RaisedButton(onPressed: (){}, child: Text('CONFIG')),            
          RaisedButton(onPressed: ()
          {
            //========================================================================
            // 3) PRINT LOG
            //======================================================================== 
            logger.i("E-mail" + _usernameController.text);
            //========================================================================
            // 4) VALIDATE
            //========================================================================             
            if (_usernameController.text == "" || _docTitleController.text == ""){
              showMessageBox(context, "Error", "Please enter Doc Title", actions: [dismissButton(context)]);
              logger.e("Username or password cannot be null");              
            } // IF
            //========================================================================
            // 5) SIGNUP USER
            //========================================================================             
            else {
              dNewDoc(context, {"username": _usernameController.text, "title": _docTitleController.text, "docId": _docIdController.text,},_docIdController.text);              
            }  
            //========================================================================
            // 6) BUTTON NAME
            //========================================================================                         
          },child: Text('SAVE'),),               

        ],
      ),
    );
  }
}



//**************************************************************************************************************************/
// FUNCTION
//**************************************************************************************************************************/
//======================================================
// FUNCTION SCAN
//======================================================
void fnScan() {}


//**************************************************************************************************************************/
// WIDGET
//**************************************************************************************************************************/
//======================================================
// WIDGET: BUTTOM BUTTON BAR
//======================================================
Column columnButtomButtonBar(BuildContext context, myIconData, String myLabel) {
  return Column(
    children: <Widget>[
      IconButton(
        iconSize: 30.0,
        icon: Icon(myIconData),
        onPressed: () {
        // ===================================================================  
        // CHECK IF CLICK "SUBMIT"
        // ===================================================================        
        dSubmitDoc(context, {"username": 'traitet', "title": 'Petty Cash - Submit', "docId": 'D2000001',},'D2000001');    
        },
      ),
      Text(
        myLabel,
      )
    ],
  );
}

//======================================================
// WIDGET:IMAGE BODY WIDGET
//======================================================
Widget widgetBodyImage() =>
 Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset('assets/images/bg01.jpg',
          width: 300, height: 200, fit: BoxFit.cover),
    );

//======================================================
// WIDGET: BODY TEXT
//======================================================
Widget widgetBodyText = Container(
  child: Padding(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Container(
                  child: Text(
                    "E-Document: 5 Mar 2020, 13:30",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text(
                "Mr. Kandersteg Switzerland",
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              )
            ],
          ),
        ),
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        Text("41"),
      ],
    ),
  ),
);
