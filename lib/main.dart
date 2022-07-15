import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const AlarmWithYoutube());
}

class AlarmWithYoutube extends StatefulWidget {
  const AlarmWithYoutube({Key? key}) : super(key: key);

  @override
  State<AlarmWithYoutube> createState() => _AlarmWithYoutubeState();
}

class _AlarmWithYoutubeState extends State<AlarmWithYoutube> {
  int _selectedHour = 0;
  int _selectedMinutes = 0;
  int _selectedNapMinutes = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Text("Hour: $_selectedHour"),
                          Slider(
                              label: _selectedHour.toString(),
                              value: _selectedHour.toDouble(),
                              min: 0.0,
                              max: 23.0,
                              divisions: 23,
                              onChanged: (value) {
                                setState(() {
                                  _selectedHour = value.round();
                                });
                              }),
                          const SizedBox(height: 20),
                          Text("Minutes: $_selectedMinutes"),
                          Slider(
                              label: _selectedMinutes.toString(),
                              value: _selectedMinutes.toDouble(),
                              min: 0.0,
                              max: 60.0,
                              divisions: 60,
                              onChanged: (value) {
                                setState(() {
                                  _selectedMinutes = value.round();
                                });
                              }),
                          TextButton(
                              onPressed: () {
                                FlutterAlarmClock.createAlarm(
                                    _selectedHour, _selectedMinutes);
                              },
                              child: const Text("Set Alarm")),
                        ],
                      ),
                    ))),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                      // border: Border.all(width: 1, color: Colors.grey.shade600),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Text("Minutes: $_selectedNapMinutes"),
                        Slider(
                            label: _selectedNapMinutes.toString(),
                            value: _selectedNapMinutes.toDouble(),
                            min: 0.0,
                            max: 60.0,
                            divisions: 60,
                            onChanged: (value) {
                              setState(() {
                                _selectedNapMinutes = value.round();
                              });
                            }),
                        TextButton(
                            onPressed: () {
                              DateTime currentTime = DateTime.now();
                              int _currentMinutes = currentTime.minute;
                              int _currentHour = currentTime.hour;

                              int _computedMinutes = 0;
                              int _computedHour = 0;

                              if (_currentMinutes + _selectedNapMinutes > 59) {
                                _computedMinutes =
                                    (_currentMinutes + _selectedNapMinutes) -
                                        60;
                                _computedHour = _currentHour + 1;
                              } else {
                                _computedMinutes =
                                    _currentMinutes + _selectedNapMinutes;
                                _computedHour = _currentHour;
                              }

                              FlutterAlarmClock.createAlarm(
                                  _computedHour, _computedMinutes);
                            },
                            child: const Text("Nap Time")),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
