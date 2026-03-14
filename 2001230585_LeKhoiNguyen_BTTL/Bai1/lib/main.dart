import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Máy tính Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = "0";

  // Nút không viền (MC, MR...)
  Widget buildTextButton(String text) {
    return Expanded(
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }

  // Nút có nền (số, phép toán) -> vuông bo tròn
  Widget buildCalcButton(String text, {Color? color}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.grey[300],
            foregroundColor: Colors.black,
            padding: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // vuông bo tròn
            ),
          ),
          onPressed: () {
            setState(() {
              output = text; // tạm thời hiển thị nút bấm
            });
          },
          child: Text(text, style: const TextStyle(fontSize: 20)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Drawer chiếm 2/3 màn hình
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 2 / 3,
        child: Drawer(
          child: ListView(
            children: const [
              DrawerHeader(
                child: Text(
                  "Calculator Menu",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(leading: Icon(Icons.calculate), title: Text("Standard")),
              ListTile(leading: Icon(Icons.science), title: Text("Scientific")),
              ListTile(
                leading: Icon(Icons.show_chart),
                title: Text("Graphing"),
              ),
              ListTile(leading: Icon(Icons.code), title: Text("Programmer")),
              ListTile(
                leading: Icon(Icons.date_range),
                title: Text("Date calculation"),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.attach_money),
                title: Text("Currency"),
              ),
              ListTile(leading: Icon(Icons.square_foot), title: Text("Volume")),
              ListTile(leading: Icon(Icons.straighten), title: Text("Length")),
              ListTile(
                leading: Icon(Icons.fitness_center),
                title: Text("Weight and mass"),
              ),
              ListTile(
                leading: Icon(Icons.thermostat),
                title: Text("Temperature"),
              ),
              ListTile(leading: Icon(Icons.bolt), title: Text("Energy")),
              ListTile(leading: Icon(Icons.crop_square), title: Text("Area")),
              ListTile(leading: Icon(Icons.speed), title: Text("Speed")),
              Divider(),
              ListTile(leading: Icon(Icons.settings), title: Text("Settings")),
            ],
          ),
        ),
      ),

      // AppBar với menu, Standard, history
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Text(
          "Standard",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.history, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),

      body: Column(
        children: [
          // Màn hình hiển thị kết quả
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(20),
              child: Text(output, style: const TextStyle(fontSize: 48)),
            ),
          ),

          // Hàng 1: MC MR M+ M- MS Mv
          Row(
            children: [
              buildTextButton("MC"),
              buildTextButton("MR"),
              buildTextButton("M+"),
              buildTextButton("M-"),
              buildTextButton("MS"),
              buildTextButton("Mv"),
            ],
          ),

          // Hàng 2: % CE C ⌫
          Row(
            children: [
              buildCalcButton("%"),
              buildCalcButton("CE"),
              buildCalcButton("C"),
              buildCalcButton("⌫"),
            ],
          ),

          // Hàng 3: 1/x x² √x ÷
          Row(
            children: [
              buildCalcButton("1/x"),
              buildCalcButton("x²"),
              buildCalcButton("√x"),
              buildCalcButton("÷"),
            ],
          ),

          // Hàng 4: 7 8 9 ×
          Row(
            children: [
              buildCalcButton("7"),
              buildCalcButton("8"),
              buildCalcButton("9"),
              buildCalcButton("×"),
            ],
          ),

          // Hàng 5: 4 5 6 −
          Row(
            children: [
              buildCalcButton("4"),
              buildCalcButton("5"),
              buildCalcButton("6"),
              buildCalcButton("−"),
            ],
          ),

          // Hàng 6: 1 2 3 +
          Row(
            children: [
              buildCalcButton("1"),
              buildCalcButton("2"),
              buildCalcButton("3"),
              buildCalcButton("+"),
            ],
          ),

          // Hàng 7: +/− 0 . =
          Row(
            children: [
              buildCalcButton("+/−"),
              buildCalcButton("0"),
              buildCalcButton("."),
              buildCalcButton("=", color: Colors.blue), // nút "=" màu xanh
            ],
          ),
        ],
      ),
    );
  }
}
