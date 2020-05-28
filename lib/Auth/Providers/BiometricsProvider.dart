import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
class BiometricsProvider with ChangeNotifier
{
  

  //Check if the phone is biometrics
  bool _canCheckBiometrics = false;

  bool get canCheckBiomterics => _canCheckBiometrics;

  set canCheckBiomterics(bool value)
  {
    _canCheckBiometrics = value;
  }

  //Get list of available biometrics
  List<BiometricType> _availableBiometrics;

  List<BiometricType> get availableBiometrics => _availableBiometrics;

  set availableBiometrics(List<BiometricType> list)
  {
    _availableBiometrics = list;
  }



  //Authentication
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  set isAuthenticated(bool value)
  {
    _isAuthenticated = value;
  }
}