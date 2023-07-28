import 'package:flutter/material.dart';

const defaultwidth = 100.0;

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool _isZoomed = false;
  var _bottonTitle = 'Zoom In';
  var _width = defaultwidth;
  var _curve = Curves.bounceOut;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(seconds: 2),
                curve: _curve,
                width: _width,
                child: Image.asset(
                  'assets/m.jpg',
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _isZoomed = !_isZoomed;
                _bottonTitle = _isZoomed ? 'Zoom Out' : 'Zoom In';
                _width =
                    _isZoomed ? MediaQuery.sizeOf(context).width : defaultwidth;
                _curve = _isZoomed ? Curves.bounceInOut : _curve;
              });
            },
            child: Text(_bottonTitle),
          ),
        ],
      ),
    );
  }
}
