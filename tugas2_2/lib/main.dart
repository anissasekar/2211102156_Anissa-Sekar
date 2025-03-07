import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Part 2',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const MyHomePage(title: 'Demo Layout Part 2'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final data = const [
    {"tgl": "26/01/2024", "nilai": "180"},
    {"tgl": "18/03/2024", "nilai": "150"},
    {"tgl": "06/04/2024", "nilai": "170"},
    {"tgl": "09/04/2024", "nilai": "145"},
    {"tgl": "01/05/2024", "nilai": "190"},
    {"tgl": "24/05/2024", "nilai": "185"},
    {"tgl": "21/06/2024", "nilai": "130"},
    {"tgl": "15/07/2024", "nilai": "155"},
    {"tgl": "11/08/2024", "nilai": "160"},
    {"tgl": "29/12/2024", "nilai": "140"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Welcome,",
                            style: TextStyle(
                              color: Color.fromARGB(255, 194, 103, 240),
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.25,
                            ),
                          ),
                          Text(
                            "2211102156_Anissa Sekar Prasasti",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 144, 40, 188),
                            ),
                          ),
                        ],
                      ),
                      const CircleAvatar(radius: 20),
                    ],
                  ),
                ),
                // Status Box
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 35,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 116, 57, 235),
                        Color.fromARGB(255, 116, 57, 235),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Status tes TOEFL Anda:',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "LULUS",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.25,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Listening\n      80',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Structure\n      80',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Reading\n      80',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                // Riwayat Tes
                Container(
                  child: Text(
                    'Riwayat Tes',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.25,
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  child: ListView.builder(
                    itemCount: data.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Tanggal tes:\nNilai:',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 128, 33, 243),
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                data[index]["tgl"]! + "\n" + data[index]["nilai"]!,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 128, 33, 243),
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
