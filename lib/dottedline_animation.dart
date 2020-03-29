import 'package:flutter/material.dart';

class DotedLineAnimation extends StatefulWidget {
  @override
  _DotedAnimationState createState() => _DotedAnimationState();
}

class _DotedAnimationState extends State<DotedLineAnimation>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<Offset> animation;
  bool selected = false;

  var _height = 6.0;
  var _width = 0.0;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = Tween<Offset>(begin: Offset.zero, end: Offset(1.0, 0.0))
        .animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _width = MediaQuery.of(context).size.width;
            animationController.forward();
          });
        },
        tooltip: 'Toggle',
        child: Icon(Icons.threed_rotation),
      ),
      body: SafeArea(
        child: Center(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: AnimatedContainer(
                  width: _width,
                  height: _height,
                  color: Colors.transparent,
                  alignment: AlignmentDirectional.topStart,
                  duration: Duration(seconds: 1),
                  curve: Curves.easeIn,
                  child: dotContainer(),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: bigDot(),
              ),
              Align(
                child: bigDot(),
                alignment: Alignment.centerRight,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bigDot() => ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          height: 40.0,
          width: 40.0,
          color: Colors.red,
        ),
      );

  Widget dotContainer() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 4.0;
        final dashHeight = _height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration:
                    BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
