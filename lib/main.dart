import 'package:clubhouse/country_codes.dart';
import 'package:clubhouse/screens/contact_screen.dart';
import 'package:clubhouse/screens/login_screen.dart';
import 'package:clubhouse/screens/name_screen.dart';
import 'package:clubhouse/screens/picture_screen.dart';
import 'package:clubhouse/screens/username_screen.dart';
import 'package:clubhouse/screens/welcome_screen.dart';

import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: [SystemUiOverlay.top])
      .then((_) => runApp(const ClubHouseApp()));
}

class ClubHouseApp extends StatelessWidget {
  const ClubHouseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: ScreenUtil.defaultSize,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return ChangeNotifierProvider<CodeProvider>(
            create: (BuildContext context) => CodeProvider(),
            child: MaterialApp(
              theme: ThemeData(),
              builder: (context, child) {
                final defaultTheme = Theme.of(context);
                if (defaultTheme.platform == TargetPlatform.android) {
                  return new Theme(data: defaultTheme, child: child!);
                }
                return child!;
              },
              supportedLocales: const [Locale('en', 'US')],
              localizationsDelegates: const [
                CountryLocalizations.delegate,
              ],
              debugShowCheckedModeBanner: false,
              initialRoute: WelcomeScreen.id,
              routes: {
                WelcomeScreen.id: (context) => const WelcomeScreen(),
                LoginScreen.id: (context) => const LoginScreen(),
                NameScreen.id: (context) => const NameScreen(),
                UserScreen.id: (context) => const UserScreen(),
                PictureScreen.id: (context) => const PictureScreen(),
                Contact.id: (context) => const Contact(),
              },
            ),
          );
        });
  }
}
