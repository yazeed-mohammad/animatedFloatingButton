import 'package:animated_floating_button_pro/floating_action_button.dart';
import 'package:animated_floating_button_pro/floating_button_props.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AnimatedFloatingButton(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
        childrenProps: [
          FloatingButtonProps(
            label: "First",
            icon: Icons.one_x_mobiledata,
            action: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("First"))),
          ),
          FloatingButtonProps(
            label: "Second",
            customIcon: const Text('2'),
            labelDecoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8),
            ),
            labelStyle: const TextStyle(color: Colors.white),
            action: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Second"))),
          ),
        ],
      ),
    );
  }
}
