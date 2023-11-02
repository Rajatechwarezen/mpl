import 'package:flutter/material.dart';
import 'package:mplpro/screen/header/appbar.dart';
import 'package:mplpro/screen/tap3/newData.dart';
import 'package:mplpro/utilis/AllColor.dart';
import 'package:mplpro/utilis/globlemargin.dart';

class NewsLayout extends StatelessWidget {
  final MyNews newsData;

  NewsLayout({required this.newsData});

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar:CustomAppBar(
        title: 'MPL',
      ),
        body: SafeArea(
          child: SingleChildScrollView(
          child: Container(
            margin: GlobleglobleMargin.globleMargin,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(newsData.image),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    newsData.description,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    newsData.pubDate,
                    style: TextStyle(color: myColorGray),
                  ),
                ),
                SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: newsData.content.length,
                  itemBuilder: (context, index) {
                    final content = newsData.content[index];
                    if (content.startsWith('<i>') && content.endsWith('</i>')) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          content.substring(3, content.length - 4),
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      );
                    } else if (content.startsWith('<b>') &&
                        content.endsWith('</b>')) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          content.substring(3, content.length - 4),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      );
                    } else if (content.startsWith('<a href=') &&
                        content.endsWith('</a>')) {
                      final linkText = content.substring(
                        content.indexOf('">') + 2,
                        content.length - 4,
                      );
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: InkWell(
                          onTap: () {
                            // Handle link tap
                          },
                          child: Text(
                            linkText,
                            style: const TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(content),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
              ),
        ),
    );
  }
}
