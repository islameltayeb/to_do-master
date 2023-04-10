import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:to_do/provider/setting_provider.dart';
import 'package:to_do/ui/screens/home/home.dart';
import 'package:to_do/utility/mythemedata.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ///CACHE_SIZE_UNLIMITED
  FirebaseFirestore.instance.settings =
      const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);

  await FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider(
    create: (context) => SettingProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SettingProvider provider = Provider.of(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do',
      theme: MythemeData.lightTheme,
      darkTheme: MythemeData.darkTheme,
      themeMode: provider.currentMode,
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English, no country code
        Locale('ar'), // Spanish, no country code
      ],
      locale: Locale(provider.currantLanguage),
      routes: {
        Home.routeName: (_) => Home(),
      },
      initialRoute: Home.routeName,
    );
  }
}
