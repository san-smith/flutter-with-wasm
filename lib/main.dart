import 'fib.dart' if (dart.library.html) 'fib_web.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final int _value = 42;
  int? _result;
  bool _inProgress = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$_value-й член ряда Фибоначчи равен: ${_result == null ? '?' : '$_result'}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: _onPressed,
                child: _inProgress
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Найти'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressed() {
    setState(() => _inProgress = true);

    // Вызов функции, которая долго вычисляется
    compute((n) => fib(n), _value).then((value) {
      _result = value;
      setState(() => _inProgress = false);
    });
  }
}
