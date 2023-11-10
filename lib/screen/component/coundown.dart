import 'package:flutter/material.dart';
import 'dart:async';

import 'package:mplpro/utilis/AllColor.dart';

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
      case 'Jan':
        month = 1;
        break;
      case 'Feb':
        month = 2;
        break;
      case 'Mar':
        month = 3;
        break;
      case 'Apr':
        month = 4;
        break;
      case 'May':
        month = 5;
        break;
      case 'Jun':
        month = 6;
        break;
      case 'Jul':
        month = 7;
        break;
      case 'Aug':
        month = 8;
        break;
      case 'Sep':
        month = 9;
        break;
      case 'Oct':
        month = 10;
        break;
      case 'Nov':
        month = 11;
        break;
      case 'Dec':
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
  int days = seconds ~/ (24 * 60 * 60);
  int hours = remainingSeconds ~/ (60 * 60);
  remainingSeconds = remainingSeconds % (60 * 60);
  int minutes = remainingSeconds ~/ 60;
  remainingSeconds = remainingSeconds % 60;

  String daysStr = days.toString().padLeft(2, '0');
  String hoursStr = hours.toString().padLeft(2, '0');
  String minutesStr = minutes.toString().padLeft(2, '0');
  String secondsStr = remainingSeconds.toString().padLeft(2, '0');

 
    if (daysStr == '00') {
   return '${daysStr == '00' ? '' : daysStr +":" }${hoursStr == '00' ? '' : "$hoursStr" }:$minutesStr:$secondsStr';
  } else {
    return '$daysStr Days';
  }
}


@override
Widget build(BuildContext context) {
  Duration timeRemaining = matchStartTime.difference(DateTime.now());
  
  return Container(
  
   
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      children: [
        DefaultTextStyle(
            style: TextStyle(
              color: timeRemaining.isNegative ? myColorRed : myColorgreen, 
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          child: Text(
            timeRemaining.isNegative
                ? "Match Over"
                : formatTime(timeRemaining.inSeconds),
          
          ),
        ),
      ],
    ),
  );
}
  }
String getMatchStatus(int totalSeconds, String matchDate, String matchTime) {
  DateTime matchStartTime = DateTime.now();

  // Parse the match date and time
  final matchTimeParts = matchTime.split(':');
  var hours = int.parse(matchTimeParts[0].trim());
  final minutes = int.parse(matchTimeParts[1].split(' ')[0].trim());
  final amPm = matchTimeParts[1].split(' ')[1].trim().toLowerCase();

  DateTime now = DateTime.now();
  int year = now.year;
  int day = int.parse(matchDate.split('-')[0]);
  String monthStr = matchDate.split('-')[1];
  int month;

  switch (monthStr) {
    case 'Jan':
      month = 1;
      break;
    case 'Feb':
      month = 2;
      break;
    case 'Mar':
      month = 3;
      break;
    case 'Apr':
      month = 4;
      break;
    case 'May':
      month = 5;
      break;
    case 'Jun':
      month = 6;
      break;
    case 'Jul':
      month = 7;
      break;
    case 'Aug':
      month = 8;
      break;
    case 'Sep':
      month = 9;
      break;
    case 'Oct':
      month = 10;
      break;
    case 'Nov':
      month = 11;
      break;
    case 'Dec':
      month = 12;
      break;
    default:
      month = 1;
  }

  if (amPm == 'pm' && hours != 12) {
    hours += 12;
  }

  matchStartTime = DateTime(year, month, day, hours, minutes);

  Duration timeRemaining = matchStartTime.difference(DateTime.now());

  if (timeRemaining.isNegative) {
    return "Match Over";
  } else {
    int seconds = timeRemaining.inSeconds;
    int remainingSeconds = seconds % (24 * 60 * 60);
    int days = seconds ~/ (24 * 60 * 60);
    int hours = remainingSeconds ~/ (60 * 60);
    remainingSeconds = remainingSeconds % (60 * 60);
    int minutes = remainingSeconds ~/ 60;
    remainingSeconds = remainingSeconds % 60;

    String daysStr = days.toString().padLeft(2, '0');
    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');

    if (daysStr == '00') {
      return '${daysStr == '00' ? '' : daysStr + ":" }${hoursStr == '00' ? '' : "$hoursStr" }:$minutesStr:$secondsStr';
    } else {
      return '$daysStr Days';
    }
  }
}

// Usage:

