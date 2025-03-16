import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: _title, home: MyStatefulWidget());
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home', style: optionStyle),
    Text('Index 1: Business', style: optionStyle),
    Text('Index 2: School', style: optionStyle),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BottomNavigationBar Sample')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: _widgetOptions.elementAt(_selectedIndex)),
          const SizedBox(height: 20), // Jarak antara text dan button
          PopupMenuButton<int>(
            child: TextButton(
              onPressed: null,
              child: const Text('Menu'), // Tidak diperlukan untuk PopupMenuButton
            ),
            onSelected: (int value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              const PopupMenuItem<int>(
                value: 0,
                child: Text('Home'),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text('Business'),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text('School'),
              ),
            ],
          ),
          const SizedBox(height: 20), // Jarak antara menu dan tombol submit
          ElevatedButton(
            onPressed: () {
              print('ini done');
            },
            child: const Text('Submit'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
