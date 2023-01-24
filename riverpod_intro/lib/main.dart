import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// steps
// build u.i
// create counter provider
// wrap root widget with provider scope
// convert counter screen widget to consumer widget
// add widget ref in build - we can user ref to watch listen
// use ref to read counter provider in floating action button
// use ref to watch the int
// diff b2n watch & read -
//    the watch checks the value provided by the counter provider and if there are any changes the u.i get rebuild

final counterProvider = StateProvider((ref) => 0);
// independent of flutter
// to make riverpod work with flutter

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go To Counter Screen'),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) => const CounterScreen()),
              ),
            );
          },
        ),
      ),
    );
  }
}

// in riverpod to get access to your providers you need to make your widgets consumer widgets

// class CounterScreen extends StatelessWidget {
class CounterScreen extends ConsumerWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  // Widget build(BuildContext context) {
  Widget build(BuildContext context, WidgetRef ref) {
    final int counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),
        actions: [
          IconButton(
            onPressed: () {
              ref.refresh(counterProvider);
            },
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: Center(
        child: Text(
          counter.toString(),
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
      ),
    );
  }
}
