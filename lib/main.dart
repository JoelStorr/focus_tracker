import 'package:flutter/material.dart';
import "package:focus_tracker/screens/focus_timer.dart";
import "package:focus_tracker/components/ui/aria_card.dart";

void main() {
  runApp(const MainApp());
}

class Tab<T> {
  const Tab({required this.title, required this.page});

  final String title;
  final T page;
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static List<Tab> tabs = [
    Tab<FocusTimer>(title: "FocusTimer", page: FocusTimer()),
  ];

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
                    ...tabs.map((el) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(
                            context,
                          ).push(MaterialPageRoute(builder: (ctx) => el.page));
                        },
                        child: AriaCard(el.title),
                      );
                    }),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
