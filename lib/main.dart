import 'package:esap/generated/l10n.dart';
import 'package:esap/screens/MyProfile/MyProfileScreen.dart';
import 'package:esap/screens/PasswordRecovery/PasswordRecoveryScreen.dart';
import 'package:esap/screens/PasswordRecovery/screens/PasswordResetScreen.dart';
import 'package:esap/screens/ProblemDetails/ProblemDetailsScreen.dart';
import 'package:esap/screens/Profile/ProfileScreen.dart';
import 'package:esap/screens/Scanner/ScannerScreen.dart';
import 'package:esap/screens/SignIn/SignInScreen.dart';
import 'package:esap/screens/Upload/UploadStep1Screen.dart';
import 'package:esap/screens/Upload/UploadStep2Screen.dart';
import 'package:esap/screens/home/HomeScreen.dart';
import 'package:esap/screens/home/screens/FocusedSearch/FocusedSearchScreen.dart';
import 'package:esap/screens/home/screens/SubmittedSearch/SubmittedSearchScreen.dart';
import 'package:esap/screens/OnBoarding/OnBoardingScreen.dart';
import 'package:esap/screens/registration/RegistrationScreen.dart';
import 'package:esap/screens/verification/VerificationScreen.dart';
import 'package:esap/routes.dart';
import 'package:esap/states/DataState.dart';
import 'package:esap/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => DataState(),
      lazy: true,
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: routes,
        initialRoute: OnBoardingRoute,
        theme: _theme(),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: Locale.fromSubtags(languageCode: "ru"),
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  Route<dynamic> routes(RouteSettings settings) {
    Widget screen;
    Map<String, dynamic> arguments = settings.arguments;
    String name = settings.name;

    switch (name) {
      case HomeRoute:
        screen = HomeScreen();
        break;
      case UploadStep1Route:
        screen = UploadStep1Screen();
        break;
      case UploadStep2Route:
        screen = UploadStep2Screen();
        break;
      case ScannerRoute:
        screen = ScannerScreen();
        break;
      case MyProfileRoute:
        screen = MyProfileScreen(arguments["user"]);
        break;
      case ProfileRoute:
        screen = ProfileScreen(arguments["user"]);
        break;
      case ProblemRoute:
        screen = ProblemDetailsScreen(arguments["problem"]);
        break;
      case FocusedSearchRoute:
        screen = FocusedSearchScreen();
        break;
      case SubmittedSearchRoute:
        screen = SubmittedSearchScreen(arguments["searchText"]);
        break;
      case OnBoardingRoute:
        screen = OnBoardingScreen();
        break;
      case RegistrationRoute:
        screen = RegistrationScreen();
        break;
      case SignInRoute:
        screen = SignInScreen();
        break;
      case VerificationRoute:
        screen = VerificationScreen(nextRoute: arguments['nextRoute']);
        break;
      case PasswordRecoveryRoute:
        screen = PasswordRecoveryScreen();
        break;
      case PasswordResetRoute:
        screen = PasswordResetScreen();
        break;
    }

    return MaterialPageRoute(
      builder: (_) => screen,
      settings: RouteSettings(name: name),
    );
  }

  ThemeData _theme() {
    return ThemeData(
      // This is the theme of your application.
      //
      // Try running your application with "flutter run". You'll see the
      // application has a blue toolbar. Then, without quitting the app, try
      // changing the primarySwatch below to Colors.green and then invoke
      // "hot reload" (press "r" in the console where you ran "flutter run",
      // or simply save your changes to "hot reload" in a Flutter IDE).
      // Notice that the counter didn't reset back to zero; the application
      // is not restarted.
      primaryColor: primaryColor,
      accentColor: accentColor,
      backgroundColor: backgroundColor,
      scaffoldBackgroundColor: backgroundColor,
      textTheme: textTheme,
      fontFamily: mainFontFamily,
      // This makes the visual density adapt to the platform that you run
      // the app on. For desktop platforms, the controls will be smaller and
      // closer together (more dense) than on mobile platforms.
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
