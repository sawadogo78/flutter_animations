import 'package:flutter/material.dart';
import 'package:flutter_animations/animations/3d_stack_rotation.dart';
import 'package:flutter_animations/animations/animatedBuilder_transform.dart';
import 'package:flutter_animations/animations/animatedContainer.dart';
import 'package:flutter_animations/animations/curves_clipper_animations.dart';
import 'package:flutter_animations/animations/hero_animation.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 50, left: 30, right: 30),
        children: [
          ElevatedButton(
            onPressed: () {
              Get.to(
                AnimatedBuilderTransform(),
              );
            },
            child: Text("AnimatedBuilder and Transform"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(
                ChaineCurvesClipperAnimation(),
              );
            },
            child: Text("Chained Animations Curves and Clipper"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(
                StackRotation3DEffet(),
              );
            },
            child: Text("3D Stack Rotation"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(
                HeroAnimation(),
              );
            },
            child: Text("Hero Animation"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(
                AnimatedContainerExample(),
              );
            },
            child: Text('Animated Container'),
          )
        ],
      ),
    );
  }
}
