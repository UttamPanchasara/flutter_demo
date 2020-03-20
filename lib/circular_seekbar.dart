import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:flutter_circular_text/circular_text/widget.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CircularSeekBar extends StatefulWidget {
  @override
  _CircularSeekBarState createState() => _CircularSeekBarState();
}

class _CircularSeekBarState extends State<CircularSeekBar> {
  double startAngle = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Container(
            height: 200.0,
            width: 200.0,
            child: Stack(
              children: <Widget>[
                SleekCircularSlider(
                  min: 0,
                  max: 100,
                  appearance: CircularSliderAppearance(
                    angleRange: 360,
                    size: 200.0,
                    startAngle: 0,
                    customColors: CustomSliderColors(
                      progressBarColor: Colors.pink,
                    ),
                    customWidths: CustomSliderWidths(
                      trackWidth: 0.0,
                      handlerSize: 0.0,
                    ),
                  ),
                  onChange: (double value) {
                    setState(() {
                      this.startAngle = value;
                    });
                  },
                  innerWidget: (context) {
                    return Container();
                  },
                ),
                IgnorePointer(
                  child: CircularText(
                    children: [
                      TextItem(
                        text: Text(
                          '25\'c',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        space: 12,
                        startAngle: ((360 * startAngle) / 100),
                        startAngleAlignment: StartAngleAlignment.start,
                        direction: CircularTextDirection.clockwise,
                      ),
                    ],
                    backgroundPaint: Paint()..color = Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
