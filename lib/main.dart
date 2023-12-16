import 'package:flutter/material.dart';
import 'package:funny_voice_changer/src/routes/route_generator.dart';
import 'package:funny_voice_changer/src/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.homeScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
      // routes:{
        
      // },
    );
  }
}
