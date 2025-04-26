import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen Two")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text("Hello Screen Two"),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Second Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
