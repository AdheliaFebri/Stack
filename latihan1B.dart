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
}

void main() {
  stdout.write("Masukkan kalimat: ");
  String kalimat = stdin.readLineSync()!;

  // Membalik kalimat menggunakan Stack
  Stack<String> stack = Stack<String>();
  for (int i = 0; i < kalimat.length; i++) {
    stack.push(kalimat[i]);
  }

  String dibalik = '';
  while (!stack.isEmpty()) {
    dibalik += stack.pop();
  }

  print("Hasil dibalik: $dibalik");

  // Cek Palindrom (mengabaikan spasi dan huruf besar/kecil)
  String cleanOriginal = kalimat.replaceAll(' ', '').toLowerCase();
  String cleanReversed = dibalik.replaceAll(' ', '').toLowerCase();

  if (cleanOriginal == cleanReversed) {
    print("Palindrom");
  } else {
    print("Bukan Palindrom");
  }
}
