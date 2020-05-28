import 'package:flutter/material.dart';
import './Main/Utils/theme_bloc.dart';
import './Main/Views/home_view.dart';
import './Main/Classes/theme_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import './Auth/Providers/BiometricsProvider.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

final routeObserver = RouteObserver<PageRoute>();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final getValueOfisAuthenticated = Provider.of<BiometricsProvider>(context);
    final LocalAuthentication auth = LocalAuthentication();

    Future<void> _authenticate(dynamic data) async {
      bool authenticated = true;
      
      try {
        authenticated = await auth.authenticateWithBiometrics(
            localizedReason: 'Scan your fingerprint to authenticate',
            useErrorDialogs: true,
            stickyAuth: true);
      } on PlatformException catch (e) {
        print(e);
      }
//  getValueOfisAuthenticated.isAuthenticated = authenticated;
//       Fluttertoast.showToast(
//           msg: getValueOfisAuthenticated.isAuthenticated
//               .toString()
//               .toUpperCase(),
//           toastLength: Toast.LENGTH_LONG,
//           gravity: ToastGravity.BOTTOM,
//           backgroundColor: Colors.purple,
//           textColor: Colors.white,
//           fontSize: 16.0);
print(authenticated);
      if (authenticated) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => HomeView(data)));
      }
    }

    return FutureBuilder(
      future: _getTheme(),
      builder: (builder, snapshot) {
        if (snapshot.data == null) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('Loading'),
              ),
            ),
          );
        } else {
          return StreamBuilder(
            stream: bloc.darkThemeEnabled,
            initialData: snapshot.data,
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return MaterialApp(
                  home: Scaffold(
                    body: Center(
                      child: Text('Loading Data'),
                    ),
                  ),
                );
              } else {
                return MaterialApp(
                  title: 'Notes App',
                  theme: snapshot.data ? Themes.light : Themes.dark,
                  navigatorObservers: [routeObserver],
                  home: Scaffold(
                    body: Center(
                      child: RaisedButton(
                        color: Colors.orange[500],
                        child: Text('Scan for finger print'),
                        onPressed: (){
                          _authenticate(snapshot.data);

                        }


                        //navigation
                      ),
                    ),
                  ),
                );
              }
            },
          );
        }
      },
    );
  }

  _getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool val = prefs.getBool('darkTheme');
    if (val == null) {
      val = true;
    }
    print(val);
    return val;
  }
}
