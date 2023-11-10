import 'package:flutter/material.dart';
import 'package:mplpro/utilis/fontstyle.dart';

class SubSectionTitle extends StatelessWidget {
  final String title;

  SubSectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0),
      child: DefaultTextStyle(
          style:CustomStyles.header2TextStyle,
        child: Text(
          title,
        
        ),
      ),
    );
  }
}




class SectionContent extends StatelessWidget {
  final String content;

  SectionContent({required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: DefaultTextStyle(style: CustomStyles.smallTextStyle, child: Text(content,)),
    );
  }
}


class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        title,
        style:CustomStyles.headerTextStyle,
      ),
    );
  }
}