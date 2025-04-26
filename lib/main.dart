import 'package:flutter/material.dart';
import "package:focus_tracker/Screens/focus_timer.dart";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ReFocus",
      theme: ThemeData.dark(),
      home: Builder(
        builder:
            (context) => Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Focus Time", style: TextStyle()),

                    // Counter Element goes here
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const FocusTimer(),
                          ),
                        );
                      },
                      child: Text("Start"),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
