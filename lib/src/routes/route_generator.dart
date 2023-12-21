import 'package:flutter/material.dart';
import 'package:funny_voice_changer/src/routes/routes_name.dart';
import 'package:funny_voice_changer/src/screens/audio_from_device_screen.dart';
import 'package:funny_voice_changer/src/screens/audio_player_main_screen.dart';
import 'package:funny_voice_changer/src/screens/home_screen.dart';
import 'package:funny_voice_changer/src/screens/language_screen2.dart';
import 'package:funny_voice_changer/src/screens/languages_screen1.dart';
import 'package:funny_voice_changer/src/screens/onboard-screen/onboard_screen.dart';
import 'package:funny_voice_changer/src/screens/recorder/record_audio_screen.dart';
import 'package:funny_voice_changer/src/screens/setting_screen.dart';
import 'package:funny_voice_changer/src/screens/text_to_voice_screen.dart';
import 'package:funny_voice_changer/src/splash-screen/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments  as Map;

    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RoutesName.languagesScreen1:
        return MaterialPageRoute(
          builder: (context) => const LanguagesScreen1(),
        );
      case RoutesName.onBoardScreen:
        return MaterialPageRoute(
          builder: (context) => const OnBoardScreen(),
        );
      case RoutesName.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RoutesName.settingScreen:
        return MaterialPageRoute(
          builder: (context) => const SettingScreen(),
        );
      case RoutesName.recordAudioScreen:
        return MaterialPageRoute(
          builder: (context) => const RecordAudioScreen(),
        );
      case RoutesName.textToVoiceScreen:
        return MaterialPageRoute(
          builder: (context) => const TextToVoiceScreen(),
        );
      case RoutesName.audioFromDeviceScreen:
        return MaterialPageRoute(
          builder: (context) => const AudioFromDeviceScreen(),
        );
      case RoutesName.audioPlayerMainScreen:
        print('Navigating to audioPlayerMainScreen');
        return MaterialPageRoute(
          builder: (context) => AudioPlayerMainScreen(
            // text: settings.arguments,
            recordedPathNew: settings.arguments,
            textToSpeech: settings.arguments as Map,
            text: settings.arguments as Map,
            audioPlayerNew: settings.arguments as Map,
            audioModel: settings.arguments as Map,
          ),
        );
      case RoutesName.languagesScreen2:
        return MaterialPageRoute(
          builder: (_) => const LanguagesScreen2(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text(
                'Routes Error',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
    }
  }
}
