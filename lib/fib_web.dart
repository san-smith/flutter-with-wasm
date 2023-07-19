// ignore: avoid_web_libraries_in_flutter
import 'dart:js';

/// Сторонняя функция, которая долго вычисляется
int fib(int n) {
  return context.callMethod('fib', [n]);
}
