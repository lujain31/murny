import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:murny_final_project/bloc/map_bloc/map_bloc.dart';
import 'package:murny_final_project/screens/google_maps_screen.dart';
import 'package:murny_final_project/screens/splash_screen/splash_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'local_storage/shared_prefrences.dart';
import 'models/user_model.dart';

SharedPref pref = SharedPref();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await dotenv.load(fileName: ".env");

  await pref.initializePref();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: FIX, USE REQUEST
    final UserModel currentUser =
        UserModel.fromJson(jsonDecode(pref.getUser()));
    final convertedTime = DateTime.fromMillisecondsSinceEpoch(
        (currentUser.expiresAt ?? 0) * 1000);

    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MultiBlocProvider(
          providers: [
            BlocProvider<MapBloc>(
                create: (context) =>
                    MapBloc()..add(MapGetCurrentLocationEvent())),
          ],
          child: MaterialApp(
            locale: const Locale('ar'),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ar'), // Arabic
            ],
            debugShowCheckedModeBanner: false,
            home: (convertedTime.compareTo(DateTime.now()) > 0)
                ? const GoogleMapScreen()
                : const SplashScreen(),
          ));
    });
  }
}
