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
      title: 'Giới thiệu cơ sở vật chất',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FacilityScreen(),
    );
  }
}

class FacilityScreen extends StatefulWidget {
  const FacilityScreen({super.key});

  @override
  State<FacilityScreen> createState() => _FacilityScreenState();
}

class _FacilityScreenState extends State<FacilityScreen> {
  int _selectedIndex = 0;

  // Danh sách các màn hình nội dung
  static const List<Widget> _pages = <Widget>[
    Center(child: Text("🏫 Giới thiệu trường", style: TextStyle(fontSize: 24))),
    Center(child: Text("📚 Thư viện hiện đại", style: TextStyle(fontSize: 24))),
    Center(
      child: Text("🏢 Phòng học tiện nghi", style: TextStyle(fontSize: 24)),
    ),
    Center(
      child: Text("🏨 Ký túc xá sinh viên", style: TextStyle(fontSize: 24)),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ĐH Công thương TP.HCM")),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: "Giới thiệu",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Thư viện"),
          BottomNavigationBarItem(icon: Icon(Icons.class_), label: "Phòng học"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Ký túc xá"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
