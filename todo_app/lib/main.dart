import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// notifier
class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier({tasks}) : super(tasks);

  void add(Task task) {
    state = [...state, task];
  }

  void toggle(int taskId) {
    state = [
      for (final item in state)
        if (taskId == item.id)
          item.copyWith(completed: !item.completed)
        else
          item
    ];
  }
}

// provider
final tasksProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  return TaskNotifier(tasks: [
    Task(id: 1, title: 'Learn HTML'),
    Task(id: 2, title: 'Learn CSS'),
    Task(id: 3, title: 'Learn JS'),
    Task(id: 4, title: 'Build a hangman game'),
    Task(id: 5, title: 'Push code to gitlab')
  ]);
});

// model
@immutable
class Task {
  final int id;
  final String title;
  final bool completed;

  Task({
    required this.id,
    required this.title,
    this.completed = false,
  });

  Task copyWith({
    int? id,
    String? title,
    bool? completed,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }
}

void main() => runApp(
      ProviderScope(
        child: MyApp(),
      ),
    );

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

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var tasks = ref.watch(tasksProvider);

    var numCompletedTasks = tasks.where((task) {
      return task.completed == true;
    }).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TODO APP',
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
              value: numCompletedTasks / tasks.length,
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
            TaskList(),
          ],
        ),
      ),
    );
  }
}

class TaskList extends ConsumerWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var provider_tasks = ref.watch(tasksProvider);

    return Column(
      children: provider_tasks.map((task) => TaskItem(task: task)).toList(),
    );
  }
}

class TaskItem extends ConsumerWidget {
  final Task task;
  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Checkbox(
          onChanged: (newValue) =>
              ref.read(tasksProvider.notifier).toggle(task.id),
          value: task.completed,
          shape: const CircleBorder(),
        ),
        Text(task.title),
      ],
    );
  }
}
