import 'package:bmi_calculator/core/util/string_constance.dart';
import 'package:bmi_calculator/core/util/util_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BmiIndicator extends StatelessWidget {
  final double bmi;
  const BmiIndicator({super.key, required this.bmi});

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(
        showAxisLine: false,
        showTicks: true, // Show ticks on the gauge
        showLabels: true,
        showFirstLabel: false,
        startAngle: 180,
        endAngle: 360,
        minimum: 12,
        maximum: 45,
        ranges: <GaugeRange>[
          GaugeRange(
            label: "",
            startValue: 0,
            endValue: 16,
            color: Colors.redAccent,
            startWidth: 40,
            endWidth: 40,
            labelStyle: const GaugeTextStyle(fontSize: 10, color: Colors.black),

            // Position label outside the range
          ),
          GaugeRange(
              label: "",
              startValue: 16,
              endValue: 17,
              color: Colors.red[200],
              startWidth: 40,
              labelStyle:
                  const GaugeTextStyle(fontSize: 10, color: Colors.black),
              endWidth: 40),
          GaugeRange(
              label: "",
              startValue: 17,
              endValue: 18.5,
              color: Colors.yellow,
              startWidth: 40,
              labelStyle:
                  const GaugeTextStyle(fontSize: 10, color: Colors.black),
              endWidth: 40),
          GaugeRange(
              label: "",
              startValue: 18.5,
              endValue: 25,
              color: Colors.green,
              startWidth: 40,
              labelStyle:
                  const GaugeTextStyle(fontSize: 10, color: Colors.black),
              endWidth: 40),
          GaugeRange(
              label: "",
              startValue: 25,
              endValue: 30,
              color: Colors.yellow,
              startWidth: 40,
              labelStyle:
                  const GaugeTextStyle(fontSize: 10, color: Colors.black),
              endWidth: 40),
          GaugeRange(
              label: "",
              startValue: 30,
              endValue: 35,
              color: Colors.red[200],
              startWidth: 40,
              labelStyle:
                  const GaugeTextStyle(fontSize: 10, color: Colors.black),
              endWidth: 40),
          GaugeRange(
              label: "",
              startValue: 35,
              endValue: 40,
              color: Colors.redAccent,
              startWidth: 40,
              labelStyle:
                  const GaugeTextStyle(fontSize: 10, color: Colors.black),
              endWidth: 40),
          GaugeRange(
              startValue: 40,
              endValue: double.infinity,
              color: Colors.red,
              startWidth: 40,
              endWidth: 40)
        ],
        pointers: <GaugePointer>[
          NeedlePointer(
            value: bmi,
            needleColor: Colors.grey,
            needleStartWidth: 1,
            needleLength: 0.7,
            needleEndWidth: 1,
            knobStyle: const KnobStyle(
              knobRadius: 0.03,
              color: Colors.grey,
            ),
          ),
          MarkerPointer(
            value: bmi,
            color: Colors.black,
            markerHeight: 17,
            markerWidth: 12,
            markerOffset: 47,
            markerType: MarkerType.triangle,
            borderColor: Colors.black,
            borderWidth: 2,
          )
        ],
        annotations: <GaugeAnnotation>[
          GaugeAnnotation(
              widget: Text("BMI = ${bmi.toStringAsFixed(4)}",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold)),
              angle: -90,
              positionFactor: 0.2),
          GaugeAnnotation(
            widget: CircularText(
              radius: UtilFunction.calculateRadiusPercentage(
                      context: context, percentage: 0.95) +
                  20,
              children: [
                TextItem(
                  text: const Text(
                    StringConstance.underweight,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  space: 2,
                  startAngle: 190,
                  startAngleAlignment: StartAngleAlignment.start,
                  direction: CircularTextDirection.clockwise,
                ),
                TextItem(
                  text: const Text(
                    StringConstance.normal,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  space: 2,
                  startAngle: 230,
                  startAngleAlignment: StartAngleAlignment.start,
                  direction: CircularTextDirection.clockwise,
                ),
                TextItem(
                  text: const Text(
                    StringConstance.overweight,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  space: 2,
                  startAngle: 260,
                  startAngleAlignment: StartAngleAlignment.start,
                  direction: CircularTextDirection.clockwise,
                ),
                TextItem(
                  text: const Text(
                    StringConstance.obesity,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  space: 2,
                  startAngle: 310,
                  startAngleAlignment: StartAngleAlignment.start,
                  direction: CircularTextDirection.clockwise,
                ),
              ],
            ),
            angle: 180, // Adjust the angle for positioning
            positionFactor: 0.03, // Adjust the positionFactor for distance
          ),
        ],
      )
    ]);
  }
}
