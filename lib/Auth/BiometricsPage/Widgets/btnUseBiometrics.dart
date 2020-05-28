import 'dart:async';
import 'package:BIO/Auth/Providers/BiometricsProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class btnUseBiometrics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final getValueOfisAuthenticated = Provider.of<BiometricsProvider>(context);
    final LocalAuthentication auth = LocalAuthentication();

    Future<void> _authenticate() async {
      bool authenticated = false;
      try {
        authenticated = await auth.authenticateWithBiometrics(
            localizedReason: 'Scan your fingerprint to authenticate',
            useErrorDialogs: true,
            stickyAuth: true);
      } on PlatformException catch (e) {
        print(e);
      }
      getValueOfisAuthenticated.isAuthenticated = authenticated;
      Fluttertoast.showToast(
          msg: getValueOfisAuthenticated.isAuthenticated
              .toString()
              .toUpperCase(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.purple,
          textColor: Colors.white,
          fontSize: 16.0);

      if (authenticated) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Scaffold()));
      }
    }

    return Center(
      child: RaisedButton(
        color: Colors.orange[500],
        child: Text('Scan for finger print'),
        onPressed: _authenticate,

        //navigation
      ),
    );
  }
}
