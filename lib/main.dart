import 'package:flutter/material.dart';

void main() {
  runApp(const FPBApp());
}

class FPBApp extends StatelessWidget {
  const FPBApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FPB Calculator',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FPB Calculator'),
          centerTitle: true,
        ),
        body: const Center(
          child: FPBCalculator(),
        ),
      ),
    );
  }
}

class FPBCalculator extends StatefulWidget {
  const FPBCalculator({Key? key}) : super(key: key);

  @override
  _FPBCalculatorState createState() => _FPBCalculatorState();
}

class _FPBCalculatorState extends State<FPBCalculator> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String _result = "";

  int hitungFPB(int a, int b) {
    while (b != 0) {
      int temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }

  void _calculateFPB() {
    final int number1 = int.tryParse(_controller1.text) ?? 0;
    final int number2 = int.tryParse(_controller2.text) ?? 0;

    if (number1 > 0 && number2 > 0) {
      final int fpb = hitungFPB(number1, number2);
      setState(() {
        _result = 'FPB $number1 dan $number2 = $fpb';
      });
    } else {
      setState(() {
        _result = 'Masukkan angka positif yang valid!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: _controller1,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Bilangan 1',
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _controller2,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Bilangan 2',
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _calculateFPB,
            child: const Text('Hitung FPB'),
          ),
          const SizedBox(height: 20),
          Text(
            _result,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
