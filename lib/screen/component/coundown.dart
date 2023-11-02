import 'package:flutter/material.dart';
import 'dart:async';

class SimpleCounter extends StatefulWidget {
  final int totalSeconds;
  final String matchDate;
  final String matchTime;

  SimpleCounter({
    required this.totalSeconds,
    required this.matchDate,
    required this.matchTime,
  });

  @override
  _SimpleCounterState createState() => _SimpleCounterState();
}

class _SimpleCounterState extends State<SimpleCounter> {
  late Timer _timer;
  int _currentSeconds = 0;
  DateTime matchStartTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _currentSeconds = widget.totalSeconds;
    startTimer();

    // Parse the match date and time
    final matchTimeParts = widget.matchTime.split(':');
    var hours = int.parse(matchTimeParts[0].trim());
    final minutes = int.parse(matchTimeParts[1].split(' ')[0].trim());
    final amPm = matchTimeParts[1].split(' ')[1].trim().toLowerCase();

    DateTime now = DateTime.now();
    int year = now.year;
    int day = int.parse(widget.matchDate.split('-')[0]);
    String monthStr = widget.matchDate.split('-')[1];
    int month;

    switch (monthStr) {
      case 'jan':
        month = 1;
        break;
      case 'feb':
        month = 2;
        break;
      case 'mar':
        month = 3;
        break;
      case 'apr':
        month = 4;
        break;
      case 'may':
        month = 5;
        break;
      case 'jun':
        month = 6;
        break;
      case 'jul':
        month = 7;
        break;
      case 'aug':
        month = 8;
        break;
      case 'sep':
        month = 9;
        break;
      case 'oct':
        month = 10;
        break;
      case 'nov':
        month = 11;
        break;
      case 'dec':
        month = 12;
        break;
      default:
        month = 1;
    }

    if (amPm == 'pm' && hours != 12) {
      hours += 12;
    }

    matchStartTime = DateTime(year, month, day, hours, minutes);

    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_currentSeconds > 0) {
          _currentSeconds--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  String formatTime(int seconds) {
    int remainingSeconds = seconds % (24 * 60 * 60);
    int hours = remainingSeconds ~/ (60 * 60);
    remainingSeconds = remainingSeconds % (60 * 60);
    int minutes = remainingSeconds ~/ 60;
    remainingSeconds = remainingSeconds % 60;

    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr';
  }

  @override
  Widget build(BuildContext context) {
    Duration timeRemaining = matchStartTime.difference(DateTime.now());

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // Text(
          //   "Match Start Time: ${matchStartTime.toLocal()}",
          //   style: TextStyle(
          //     color: Colors.black,
          //     fontSize: 16,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          Text(
            " ${formatTime(timeRemaining.inSeconds)}",
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
