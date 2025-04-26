import 'package:flutter/material.dart';
import "package:focus_tracker/Screens/second_screen.dart";

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
            (context) => Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SecondScreen(),
                    ),
                  );
                },
                child: Text("Press Me for a new Page"),
              ),
            ),
      ),
    );
  }
}
