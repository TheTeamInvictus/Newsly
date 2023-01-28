import 'package:flutter/material.dart';
import "nav.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_uxcam/flutter_uxcam.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    String appkey = dotenv.get("UXCAM_APP_KEY", fallback: "");
    FlutterUxcam.optIntoSchematicRecordings();
    FlutterUxcam.startWithKey(appkey);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.ubuntuTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.lightBlue,
      ),
      home: const Nav(),
    );
  }
}
