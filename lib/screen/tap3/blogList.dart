import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mplpro/screen/component/darkmode.dart';

import 'package:mplpro/screen/tap3/blog.dart';
import 'package:mplpro/screen/tap3/newData.dart';
import 'package:mplpro/utilis/AllColor.dart';
import 'package:mplpro/utilis/boxSpace.dart';
import 'package:mplpro/utilis/fontstyle.dart';

import '../header/headerTop.dart';
import '../../utilis/borderbox.dart';

class Blog {
  final String title;
  final String author;
  final String date;
  final String content;
  final String imageUrl; // Add an image URL field

  Blog({
    required this.title,
    required this.author,
    required this.date,
    required this.content,
    required this.imageUrl, // Initialize the image URL
  });
}

List<Blog> blogList = [
  Blog(
    title: "Blog Title 1",
    author: "Author 1",
    date: "October 6, 2023",
    content: "This is the content of Blog 1...",
    imageUrl: "assets/ball.png", // Add image URL
  ),
  Blog(
    title: "Blog Title 2",
    author: "Author 2",
    date: "October 7, 2023",
    content: "This is the content of Blog 2...",
    imageUrl: "assets/ball.png", // Add image URL
  ),
  // Add more blogs as needed
];

class BlogList extends StatelessWidget {
  
  final List<Blog> blogs;
  MyNews sampleNews = MyNews(
    title: "Sample News Title",
    image: "assets/ball.png",
    description: "This is a sample news description.",
    pubDate: "October 6, 2023",
    content: [
      "This is the content of the news article.",
      "<i>This is italic text.</i>",
      "<b>This is bold text.</b>",
      '<a href="https://example.com">Visit Example</a>',
    ],
  );
  BlogList({required this.blogs});

   final ThemeController themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
             Simpletitlebtn(HeadName: " Matche  News"),
            size20h,
        Container(
          height: 500,
         
          child: ListView.builder(
            itemCount: blogs.length,
            itemBuilder: (context, index) {
              final blog = blogs[index];
              return Container(
                     height: 80,
                margin: EdgeInsets.only(left: 5, right: 10, top: 20),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: themeController.isLightMode.value ? myColorWhite :  myColor,
                    boxShadow: [boxshadow],
                    borderRadius: boRadiusAll),
                child: ListTile(
                  leading: Image.asset(
                    blog.imageUrl,
        
                    width: 100, // Set the width of the image
        
                    height: 150, // Set the height of the image
        
                    fit: BoxFit.cover, // Adjust the image fit as needed
                  ),
                  title: Text(blog.title),
                  subtitle: Text("By ${blog.author} - ${blog.date}",style: CustomStyles.smallTextStyle,),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewsLayout(newsData: sampleNews)),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
