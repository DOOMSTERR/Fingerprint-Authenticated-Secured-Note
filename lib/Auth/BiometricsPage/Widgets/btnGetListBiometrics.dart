import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:Notes/Auth/Providers/BiometricsProvider.dart';
import 'package:fluttertoast/fluttertoast.dart';
class btnGetListBiometrics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final LocalAuthentication auth = LocalAuthentication();
  final getListOfBiometrics = Provider.of<BiometricsProvider>(context);

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }

    getListOfBiometrics.availableBiometrics = availableBiometrics;
    Fluttertoast.showToast(
          msg: getListOfBiometrics.availableBiometrics.toString().toUpperCase(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.purple,
          textColor: Colors.white,
          fontSize: 16.0);    
    
  }






    return Center(
      child: RaisedButton(
        color: Colors.orange[500],
        child: Text('Biometrics options available'),
        onPressed: _getAvailableBiometrics ,
      ),
    );
  }
}
