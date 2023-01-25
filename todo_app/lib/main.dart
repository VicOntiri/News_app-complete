import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ALL TASKS',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Progress',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text('You are this far away from completing your todo list:'),
            const SizedBox(
              height: 10.0,
            ),
            LinearProgressIndicator(
              value: 1.0 / 10.0,
              backgroundColor: Colors.orange[100],
              color: Colors.orange,
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'Your TaskList',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text('Find your todo list below:'),
            const SizedBox(
              height: 10.0,
            ),
            TaskItem(label: 'Learn HTML'),
            TaskItem(label: 'Learn CSS'),
            TaskItem(label: 'Learn JS'),
            TaskItem(label: 'Build a hangman game'),
            TaskItem(label: 'Push code to gitlab'),
          ],
        ),
      ),
    );
  }
}

class TaskItem extends StatefulWidget {
  final String label;

  TaskItem({Key? key, required this.label}) : super(key: key);

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool? _value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          onChanged: (newValue) => setState(() => _value = newValue),
          value: _value,
          shape: const CircleBorder(),
        ),
        Text(widget.label),
      ],
    );
  }
}
