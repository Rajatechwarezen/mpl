import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:WINNER11/screen/component/darkmode.dart';

import 'package:WINNER11/screen/tap3/blog.dart';
import 'package:WINNER11/screen/tap3/blog_model.dart';
import 'package:WINNER11/screen/tap3/newData.dart';
import 'package:WINNER11/utilis/AllColor.dart';
import 'package:WINNER11/utilis/boxSpace.dart';
import 'package:WINNER11/utilis/fontstyle.dart';

import '../../service/authapi.dart';
import '../header/headerTop.dart';
import '../../utilis/borderbox.dart';

class BlogList extends StatelessWidget {
  final ApiService apiService = ApiService();

  final ThemeController themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Simpletitlebtn(HeadName: " Matche  News"),
        size20h,
        FutureBuilder(
          future: apiService.userAllblog(),
          builder: (context, snapshot) {
            return Expanded(
              child: ListView.builder(
                itemCount: apiService.liveBolg.length,
                itemBuilder: (context, index) {
                  final blog = apiService.liveBolg[index];

                  return Container(
                    height: 80,
                    margin: EdgeInsets.only(left: 5, right: 10, top: 20),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: themeController.isLightMode.value
                            ? myColorWhite
                            : myColor,
                        boxShadow: [
                          themeController.isLightMode.value
                              ? boxshadow2
                              : boxdark
                        ],
                        border: border,
                        borderRadius: boRadiusAll),
                    child: ListTile(
                      leading: Image.network(
                        blog.image,

                        width: 100, // Set the width of the image

                        height: 150, // Set the height of the image

                        fit: BoxFit.cover, // Adjust the image fit as needed
                      ),
                      title: Text(blog.description),
                      subtitle: Text("By ${blog.newsId} - ${blog.pubDate}",
                          style: CustomStyles.smallTextStyle),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsLayout(newsData: blog)),
                        );
                      },
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
