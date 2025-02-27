import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Tugas 1.2:Intro Dart Anissa Sekar')),
        body: Column(
          children: [
            Expanded(
              child: ArrayDisplay(),
            ),
            Divider(),
            Expanded(
              child: FPBCalculator(),
            ),
          ],
        ),
      ),
    );
  }
}

class ArrayDisplay extends StatelessWidget {
  const ArrayDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    List<List<int>> array = List.generate(4, (i) => []);

    for (int i = 1; i <= 4; i++) {
      array[0].add(i * 6);
    }

    for (int i = 0; i < 5; i++) {
      array[1].add(3 + i * 2);
    }

    for (int i = 4; i < 10; i++) {
      array[2].add(i * i * i);
    }

    for (int i = 0; i < 7; i++) {
      array[3].add(3 + i * 7);
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Isi List:',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 300, // Set a fixed width for the content
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: array.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      array[index].join(' '),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FPBCalculator extends StatefulWidget {
  const FPBCalculator({super.key});

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
