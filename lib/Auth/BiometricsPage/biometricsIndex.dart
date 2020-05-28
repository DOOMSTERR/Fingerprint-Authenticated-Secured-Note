import './Widgets/btnCheckPermission.dart';
import './Widgets/btnGetListBiometrics.dart';
import './Widgets/btnUseBiometrics.dart';
import '../Providers/BiometricsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class biometricsIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BiometricsProvider(),
      child: Scaffold(
        backgroundColor: Colors.white12,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            btnCheckPermission(),
            btnGetListBiometrics(),
            btnUseBiometrics()
          ],
        ),
      ),
    );
  }
}