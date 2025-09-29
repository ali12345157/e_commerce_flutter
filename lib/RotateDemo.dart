import 'package:flutter/material.dart';

class InfiniteRotateDemo extends StatefulWidget {
  const InfiniteRotateDemo({super.key});

  @override
  State<InfiniteRotateDemo> createState() => _InfiniteRotateDemoState();
}

class _InfiniteRotateDemoState extends State<InfiniteRotateDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Infinite Rotation Example")),
      body: Center(
        child: RotationTransition(
          turns: _controller,
          child: const Icon(
            Icons.sync,
            size: 100,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
