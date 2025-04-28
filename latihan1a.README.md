import 'dart:io';

class Stack<T> {
  final List<T> _stack = [];

  void push(T element) {
    _stack.add(element);
  }

  T pop() {
    if (_stack.isEmpty) {
      throw Exception('Stack kosong');
    }
    return _stack.removeLast();
  }

  bool isEmpty() {
    return _stack.isEmpty;
  }

  @override
  String toString() => _stack.reversed.join('');
}

String convertToBase(int number, int base) {
  Stack<int> stack = Stack<int>();

  while (number > 0) {
    stack.push(number % base);
    number = number ~/ base;
  }

  if (stack.isEmpty()) {
    return '0';
  }

  String result = '';
  while (!stack.isEmpty()) {
    int digit = stack.pop();
    if (digit >= 10) {
      result += String.fromCharCode(55 + digit); // 10 -> 'A', 11 -> 'B', etc.
    } else {
      result += digit.toString();
    }   
  }
  return result;
}

void main() {
  stdout.write("Masukkan nilai desimal: ");
  int desimal = int.parse(stdin.readLineSync()!);

  print("Hasil nilai biner       = ${convertToBase(desimal, 2)}");
  print("Hasil nilai oktal       = ${convertToBase(desimal, 8)}");
  print("Hasil nilai heksadesimal = ${convertToBase(desimal, 16)}");
}
# Stack
