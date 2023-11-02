import 'package:flutter/material.dart';
import 'package:mplpro/utilis/borderbox.dart';
import 'package:mplpro/utilis/boxSpace.dart';
import 'package:mplpro/utilis/fontstyle.dart';
import 'package:mplpro/utilis/globlemargin.dart';

import '../../utilis/AllColor.dart';

class Indigator extends StatefulWidget {
  var currentPage;
  Indigator({super.key, required int this.currentPage});
  @override
  State<Indigator> createState() => _IndigatorState();
}

class _IndigatorState extends State<Indigator> {
  final int _numPages = 3;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    List<String> mytext = ["SELECT MATCH", "JOIN CONTEST", "FINISHED"];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == widget.currentPage
          ? _indicator(true, mytext[i])
          : _indicator(false, mytext[i]));
    }
    return list;
  }

  Widget _indicator(bool isActive, text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            padding: GlobleglobleMargin.Margin10H,
            margin: EdgeInsets.only(right: 10),
            child: Text(
              text,
              style: TextStyle(fontSize: 11, color: isActive ?myColorRed: myColorGray,   ),
            )),
        Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              height: 10,
              width: isActive ? 20.0 : 10.0,
              decoration: BoxDecoration(
                color: isActive ? myColorRed : myColor,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(border: border),
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _buildPageIndicator(),
      ),
    );
  }
}
