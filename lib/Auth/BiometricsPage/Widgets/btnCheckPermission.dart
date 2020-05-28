import 'dart:async';
import 'package:BIO/Auth/Providers/BiometricsProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class btnCheckPermission extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final getValueOfCheckBiometrics = Provider.of<BiometricsProvider>(context);
    final LocalAuthentication auth = LocalAuthentication();

    Future<void> _checkBiometrics() async {
      bool canCheckBiometrics;
      try {
        canCheckBiometrics = await auth.canCheckBiometrics;
      } on PlatformException catch (e) {
        print(e);
      }
      getValueOfCheckBiometrics.canCheckBiomterics = canCheckBiometrics;
      Fluttertoast.showToast(
          msg: getValueOfCheckBiometrics.canCheckBiomterics.toString().toUpperCase(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.purple,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    return Center(
      child: RaisedButton(
        color: Colors.orange[500],
        child: Text('Check if device has biomterics'),
        onPressed: _checkBiometrics,
      ),
    );
  }
}
