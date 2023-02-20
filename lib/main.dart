import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String currentHex = '0xffffff';

  Color currentBackgroundColor = const Color((0xffffff)).withOpacity(1);

  void randomColorGenerator() {
    setState(() {
      currentBackgroundColor =
          Color((Random().nextDouble() * 0xffffff).toInt()).withOpacity(1);
      String currentColorToString = currentBackgroundColor.toString();
      String substringColor = currentColorToString.substring(
          currentColorToString.indexOf('(') + 1,
          currentColorToString.length - 1);
      currentHex = substringColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle styleTextBold =
        const TextStyle(fontSize: 20, fontWeight: FontWeight.w500);

    return MaterialApp(
        home: Scaffold(
      backgroundColor: currentBackgroundColor,
      body: SafeArea(
          child: InkWell(
        onTap: randomColorGenerator,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Привет', style: styleTextBold),
              const SizedBox(
                height: 10,
              ),
              Column(children: [
                const Text('Цвет заднего фона в формате HEX:',
                    style: TextStyle(fontSize: 15)),
                const SizedBox(
                  height: 10,
                ),
                Text(currentHex, style: styleTextBold),
                const SizedBox(
                  height: 10,
                ),
              ])
            ],
          ),
        ),
      )),
    ));
  }
}
