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
                    ? const CircularProgressIndicator()
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
    _result = fib(_value);

    setState(() => _inProgress = false);
  }
}

/// Сторонняя функция, которая долго вычисляется
int fib(int n) => switch (n) {
      < 2 => n,
      _ => fib(n - 2) + fib(n - 1),
    };
