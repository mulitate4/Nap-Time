// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(const NapTime());
}

class NapTime extends StatefulWidget {
  const NapTime({Key? key}) : super(key: key);

  @override
  State<NapTime> createState() => _NapTimeState();
}

class _NapTimeState extends State<NapTime> {
  int _selectedNapMinutes = 0;

  var textStyle = TextStyle(
      fontSize: 60,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      shadows: [
        Shadow(color: Colors.white, offset: Offset(1, 1), blurRadius: 30),
      ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [const Color(0xFFcad0ff), const Color(0xFFe3e3e3)])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Neumorphic(
                padding: EdgeInsets.all(20),
                style: NeumorphicStyle(
                  depth: 10,
                  color: Colors.transparent,
                  // boxShape: NeumorphicBoxShape.roundRect(
                  //     BorderRadius.circular(40)),
                  boxShape: NeumorphicBoxShape.circle(),
                ),
                child: SleekCircularSlider(
                  initialValue: 5,
                  max: 120,
                  appearance: CircularSliderAppearance(
                      startAngle: 120,
                      angleRange: 310,
                      size: 220,
                      customColors: CustomSliderColors(
                          dynamicGradient: true,
                          shadowColor: Colors.grey,
                          shadowMaxOpacity: .05,
                          shadowStep: 3,
                          dotColor: Colors.grey[400],
                          trackColor: const Color(0xFFfbe9d7),
                          progressBarColors: [
                            const Color(0xFFf6d5f7),
                            const Color(0xFFfbe9d7),
                          ])),
                  onChange: (double value) {
                    setState(() {
                      _selectedNapMinutes = value.round();
                    });
                  },
                  innerWidget: (double value) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          value.round().toString(),
                          style: textStyle,
                        ),
                        Text(
                          "Minutes",
                          style: textStyle.copyWith(
                              fontSize: 20, fontWeight: FontWeight.normal),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 40),
              NeumorphicButton(
                  style: NeumorphicStyle(depth: 10, color: Colors.transparent),
                  onPressed: () {
                    presetSetAlarm(_selectedNapMinutes);
                  },
                  child: Text(
                    "Nap Time",
                    style: textStyle.copyWith(fontSize: 20, shadows: []),
                  )),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NeumorphicButton(
                      padding: EdgeInsets.all(20),
                      style: NeumorphicStyle(
                        depth: 10,
                        color: Colors.transparent,
                        boxShape: NeumorphicBoxShape.circle(),
                      ),
                      onPressed: () {
                        presetSetAlarm(15);
                      },
                      child: Text(
                        "15",
                        style: textStyle.copyWith(fontSize: 24, shadows: []),
                      )),
                  NeumorphicButton(
                      padding: EdgeInsets.all(20),
                      style: NeumorphicStyle(
                        depth: 10,
                        color: Colors.transparent,
                        boxShape: NeumorphicBoxShape.circle(),
                      ),
                      onPressed: () {
                        presetSetAlarm(30);
                      },
                      child: Text(
                        "30",
                        style: textStyle.copyWith(fontSize: 24, shadows: []),
                      )),
                  NeumorphicButton(
                      padding: EdgeInsets.all(20),
                      style: NeumorphicStyle(
                        depth: 10,
                        color: Colors.transparent,
                        boxShape: NeumorphicBoxShape.circle(),
                      ),
                      onPressed: () {
                        presetSetAlarm(45);
                      },
                      child: Text(
                        "45",
                        style: textStyle.copyWith(fontSize: 24, shadows: []),
                      )),
                  NeumorphicButton(
                      padding: EdgeInsets.all(20),
                      style: NeumorphicStyle(
                        depth: 10,
                        color: Colors.transparent,
                        boxShape: NeumorphicBoxShape.circle(),
                      ),
                      onPressed: () {
                        presetSetAlarm(90);
                      },
                      child: Text(
                        "90",
                        style: textStyle.copyWith(fontSize: 24, shadows: []),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void presetSetAlarm(int minutes) {
    DateTime currentTime = DateTime.now();
    DateTime alarmTime = currentTime.add(Duration(minutes: minutes));

    FlutterAlarmClock.createAlarm(alarmTime.hour, alarmTime.minute);
  }
}
