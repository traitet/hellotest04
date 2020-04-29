import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hellotest04/services/LoggerService.dart';

class ReadQRPage extends StatefulWidget {
  @override
  _ReadQRPageState createState() => _ReadQRPageState();
}

class _ReadQRPageState extends State<ReadQRPage> {
  //========================================================================================
  // 1) DECLARE VARIABLE
  //========================================================================================
  String barcode = "";
  @override
  //========================================================================================
  // 2) UI FOR READ QR
  //========================================================================================
  Widget build(BuildContext context) {
      return new MaterialApp(
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text('My Barcode Scanner'),
              actions: <Widget>[IconButton(icon: Icon(Icons.camera_alt), onPressed: scan)],
            ),
            body: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(8.0),
                  ),
                  Text(barcode, style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                ],
              ),
            )),
      );
    }
  //========================================================================================
  // 3) FUNCTION#1: SCAN QR
  //========================================================================================
  Future scan() async {
      try {
        String barcode = await BarcodeScanner.scan();
        setState((){
          this.barcode = barcode ;
        });
      } on PlatformException catch (e) {
        if (e.code == BarcodeScanner.CameraAccessDenied) {
          logger.e("The user did not grant the camera permission.");
          // The user did not grant the camera permission.
        } else {
          // Unknown error.
          logger.e("Unknown error.");
        }
      } on FormatException {
        // User returned using the "back"-button before scanning anything.
      } catch (e) {
        logger.e("ERROR!! " + e.toString());
        // Unknown error.
      }
    }

}