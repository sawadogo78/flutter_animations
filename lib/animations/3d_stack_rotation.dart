import 'dart:math' show pi;

import 'package:flutter/material.dart';

import 'package:vector_math/vector_math_64.dart' show Vector3;

const widthandheight = 100.0;

class StackRotation3DEffet extends StatefulWidget {
  const StackRotation3DEffet({super.key});

  @override
  State<StackRotation3DEffet> createState() => _StackRotation3DEffetState();
}

class _StackRotation3DEffetState extends State<StackRotation3DEffet>
    with TickerProviderStateMixin {
  late AnimationController _xcontroller;
  late AnimationController _ycontroller;
  late AnimationController _zcontroller;
  late Tween<double> _animation;

  @override
  void initState() {
    super.initState();
    _xcontroller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    );
    _ycontroller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 30),
    );
    _zcontroller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 40),
    );

    _animation = Tween<double>(
      begin: 0,
      end: (pi / 2),
    );
  }

  @override
  void dispose() {
    _xcontroller.dispose();
    _ycontroller.dispose();
    _zcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _xcontroller
      ..reset()
      ..repeat();
    _ycontroller
      ..reset()
      ..repeat();
    _zcontroller
      ..reset()
      ..repeat();
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: widthandheight,
              width: double.infinity,
            ),
            AnimatedBuilder(
                animation: Listenable.merge(
                  [
                    _xcontroller,
                    _ycontroller,
                    _zcontroller,
                  ],
                ),
                builder: (context, child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..rotateX(
                        _animation.evaluate(_xcontroller),
                      ) // Using evaluate because we have more than 1 animations
                      ..rotateY(
                        _animation.evaluate(_ycontroller),
                      )
                      ..rotateZ(
                        _animation.evaluate(_zcontroller),
                      ),
                    child: Stack(
                      children: [
                        //Back
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..translate(Vector3(0, 0, -widthandheight)),
                          child: Container(
                            color: Colors.purple,
                            width: widthandheight,
                            height: widthandheight,
                          ),
                        ),
                        //Left Side
                        Transform(
                          alignment: Alignment.centerLeft,
                          transform: Matrix4.identity()..rotateY(pi / 2),
                          child: Container(
                            color: Colors.red,
                            width: widthandheight,
                            height: widthandheight,
                          ),
                        ),
                        //Right Side
                        Transform(
                          alignment: Alignment.centerRight,
                          transform: Matrix4.identity()..rotateY(-pi / 2),
                          child: Container(
                            color: Colors.blue,
                            width: widthandheight,
                            height: widthandheight,
                          ),
                        ),
                        //Front
                        Container(
                          color: Colors.green,
                          width: widthandheight,
                          height: widthandheight,
                        ),
                        //Top Side
                        Transform(
                          alignment: Alignment.topCenter,
                          transform: Matrix4.identity()..rotateX(-pi / 2),
                          child: Container(
                            color: Colors.orange,
                            width: widthandheight,
                            height: widthandheight,
                          ),
                        ),
                        //bottom Side
                        Transform(
                          alignment: Alignment.bottomCenter,
                          transform: Matrix4.identity()..rotateX(pi / 2),
                          child: Container(
                            color: Colors.brown,
                            width: widthandheight,
                            height: widthandheight,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
