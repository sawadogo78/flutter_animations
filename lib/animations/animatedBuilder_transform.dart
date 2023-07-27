import 'dart:math' show pi;

import 'package:flutter/material.dart';

class AnimatedBuilderTransform extends StatefulWidget {
  const AnimatedBuilderTransform({super.key});

  @override
  State<AnimatedBuilderTransform> createState() =>
      _AnimatedBuilderTransformState();
}

class _AnimatedBuilderTransformState extends State<AnimatedBuilderTransform>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 2 * pi).animate(_controller);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..rotateY(_animation.value),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue.shade400,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5.0,
                      blurRadius: 7.0,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
