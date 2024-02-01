import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    theme: ThemeData.dark(),

    /// Die [initialRoute] dient als "erste" Route - von dort beginnt die Seite
    initialRoute: "/",

    /// Navigation mithilfe von Routen
    /// Die Routen stellen die einzelnen Seiten dar
    /// Diese können beliebig genannt werden
    routes: {
      "/": (context) => const FirstRoute(),
      "/second": (context) => SecondRoute(
            text: "",
          ),
    },

    /// [onUnknownRoute] - wird ausgeführt sobald der gewählte Routenname nicht gefunden wurde
    onUnknownRoute: (settings) {
      return MaterialPageRoute(builder: (_) => const UnknownRoute());
    },
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Open route named'),
              onPressed: () {
                /// Mithilfe der benannten Route wird der neue Screen auf den alten gepusht
                Navigator.pushNamed(context, '/second');
              },
            ),
            ElevatedButton(
              child: const Text('Open route replacement named'),
              onPressed: () {
                /// Mithilfe der benannten Route wird der neue Screen auf den alten gepusht, der alte wird gelöscht
                Navigator.pushReplacementNamed(context, '/second');
              },
            ),
            ElevatedButton(
              child: const Text('Open route replacement'),
              onPressed: () {
                /// Mithilfe einer MaterialPageRoute wird der neue Screen auf den alten gepusht, der alte wird gelöscht
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>
                        SecondRoute(text: "Open route replacement")));
              },
            ),
            ElevatedButton(
              child: const Text('Open route'),
              onPressed: () {
                /// Mithilfe einer MaterialPageRoute wird der neue Screen auf den alten gepusht
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SecondRoute(
                          text: "Open Route",
                        )));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  String text = "";
  SecondRoute({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(text)),
    );
  }
}

class UnknownRoute extends StatelessWidget {
  const UnknownRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
    );
  }
}
