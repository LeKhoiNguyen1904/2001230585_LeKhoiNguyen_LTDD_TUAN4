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
      title: 'Tình trạng trong ngày',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MoodScreen(),
    );
  }
}

class MoodScreen extends StatelessWidget {
  const MoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mood Tracker"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Lời chào và ngày
            const Text(
              "Hi, User!",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text("15 Mar, 2026", style: TextStyle(color: Colors.grey[600])),
            const SizedBox(height: 16),

            // Thanh tìm kiếm
            TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Phần chọn tâm trạng
            const Text(
              "How do you feel?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                MoodOption(emoji: "😟", label: "Bad"),
                MoodOption(emoji: "🙂", label: "Fine"),
                MoodOption(emoji: "😊", label: "Well"),
                MoodOption(emoji: "😌", label: "Excellent"),
              ],
            ),
            const SizedBox(height: 24),

            // Danh sách hoạt động
            const Text(
              "Exercises",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: const [
                  ExerciseCard(
                    icon: Icons.record_voice_over,
                    color: Colors.orange,
                    title: "Speaking Skills",
                    count: 16,
                  ),
                  ExerciseCard(
                    icon: Icons.menu_book,
                    color: Colors.green,
                    title: "Reading Skills",
                    count: 8,
                  ),
                  ExerciseCard(
                    icon: Icons.edit,
                    color: Colors.red,
                    title: "Writing Skills",
                    count: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.note), label: "Notes"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

// Widget cho mood option
class MoodOption extends StatelessWidget {
  final String emoji;
  final String label;

  const MoodOption({super.key, required this.emoji, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 32)),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}

// Widget cho exercise card
class ExerciseCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final int count;

  const ExerciseCard({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: color, size: 32),
        title: Text(title, style: const TextStyle(fontSize: 18)),
        subtitle: Text("$count Exercises"),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
