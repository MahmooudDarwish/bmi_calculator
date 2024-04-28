import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BmiIndicator extends StatelessWidget {
  final double bmi;
  const BmiIndicator({super.key, required this.bmi});

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
        title: const GaugeTitle(
            text: 'Speedometer',
            textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        axes: <RadialAxis>[
          RadialAxis(
              labelsPosition: ElementsPosition.inside,
              startAngle: 180,
              endAngle: 360,
              minimum: 12,
              maximum: 45,
              ranges: <GaugeRange>[
                GaugeRange(
                  label: "15",
                  startValue: 0,
                  endValue: 16,
                  color: Colors.redAccent,
                  startWidth: 40,
                  endWidth: 40,
                ),
                GaugeRange(
                    startValue: 16,
                    endValue: 17,
                    color: Colors.pinkAccent,
                    startWidth: 40,
                    endWidth: 40),
                GaugeRange(
                    startValue: 17,
                    endValue: 18.5,
                    color: Colors.amber,
                    startWidth: 40,
                    endWidth: 40),
                GaugeRange(
                    startValue: 18.5,
                    endValue: 25,
                    color: Colors.green,
                    startWidth: 40,
                    endWidth: 40),
                GaugeRange(
                    startValue: 25,
                    endValue: 30,
                    color: Colors.amber,
                    startWidth: 40,
                    endWidth: 40),
                GaugeRange(
                    startValue: 30,
                    endValue: 35,
                    color: Colors.pinkAccent,
                    startWidth: 40,
                    endWidth: 40),
                GaugeRange(
                    startValue: 35,
                    endValue: 40,
                    color: Colors.redAccent,
                    startWidth: 40,
                    endWidth: 40),
                GaugeRange(
                    startValue: 40,
                    endValue: double.infinity,
                    color: Colors.red,
                    startWidth: 40,
                    endWidth: 40)
              ],
              pointers: <GaugePointer>[
                WidgetPointer(
                  child: CircleWithLine(),
                  value: 25,
                  offset: 0.0,
                ),
                MarkerPointer(
                  value: bmi,
                  markerOffset: 40,
                  markerType: MarkerType.triangle,
                ),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Container(
                        child: Text('90.0',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold))),
                    angle: 90,
                    positionFactor: 0.5)
              ])
        ]);
  }
}

class CircleWithLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(30, 60), // Size of the custom widget
      painter: CircleAndLinePainter(),
    );
  }
}

class CircleAndLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;

    // Draw the circle at the top center of the widget
    final Offset center = Offset(size.width / 2, size.height / 3);
    canvas.drawCircle(center, size.width / 3, paint);

    // Draw the line attached to the circle
    final Offset lineStart = Offset(size.width / 2, center.dy);
    final Offset lineEnd = Offset(size.width / 2, size.height);
    canvas.drawLine(lineStart, lineEnd, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
