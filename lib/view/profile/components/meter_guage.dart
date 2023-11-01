import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GaugeApp extends StatefulWidget {
  double points = 0.0;
   GaugeApp({Key? key,required this.points}) : super(key: key);

  @override
  State<GaugeApp> createState() => _GaugeAppState();
}

class _GaugeAppState extends State<GaugeApp> {
  Widget _getGauge({bool isRadialGauge = true}) {
    if (isRadialGauge) {
      return _getRadialGauge();
    } else {
      return _getLinearGauge();
    }
  }

  Widget _getRadialGauge() {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
            showLabels: false,
            showAxisLine: false,
            showTicks: false,
            minimum: 0,
            maximum: 100,
            ranges: <GaugeRange>[
              GaugeRange(
                  startValue: 0,
                  endValue: 25,
                  color: const Color(0xFFFE2A25),
                  label: 'Low',
                  sizeUnit: GaugeSizeUnit.factor,
                  labelStyle:
                      const GaugeTextStyle(fontFamily: 'Times', fontSize: 20),
                  startWidth: 0.65,
                  endWidth: 0.65),
              GaugeRange(
                startValue: 26,
                endValue: 50,
                color: const Color.fromARGB(212, 241, 178, 6),
                label: 'Average',
                labelStyle:
                    const GaugeTextStyle(fontFamily: 'Times', fontSize: 20),
                startWidth: 0.65,
                endWidth: 0.65,
                sizeUnit: GaugeSizeUnit.factor,
              ),
              GaugeRange(
                startValue: 51,
                endValue: 75,
                color: const Color(0xFFFFBA00),
                label: 'Good',
                labelStyle:
                    const GaugeTextStyle(fontFamily: 'Times', fontSize: 20),
                startWidth: 0.65,
                endWidth: 0.65,
                sizeUnit: GaugeSizeUnit.factor,
              ),
              GaugeRange(
                startValue: 76,
                endValue: 100,
                color: const Color(0xFF00AB47),
                label: 'Excellent',
                labelStyle:
                    const GaugeTextStyle(fontFamily: 'Times', fontSize: 20),
                sizeUnit: GaugeSizeUnit.factor,
                startWidth: 0.65,
                endWidth: 0.65,
              ),
            ],
            pointers:  <GaugePointer>[
              NeedlePointer(value: widget.points)
            ])
      ],
    );
  }

  Widget _getLinearGauge() {
    return Container(
      margin: const EdgeInsets.all(10),
      child:  SfLinearGauge(
          minimum: 0.0,
          maximum: 100.0,
          orientation: LinearGaugeOrientation.horizontal,
          majorTickStyle: const LinearTickStyle(length: 20),
          axisLabelStyle: const TextStyle(fontSize: 12.0, color: Colors.black),
          axisTrackStyle: const LinearAxisTrackStyle(
              color: Colors.cyan,
              edgeStyle: LinearEdgeStyle.bothFlat,
              thickness: 15.0,
              borderColor: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getGauge();
  }
}
