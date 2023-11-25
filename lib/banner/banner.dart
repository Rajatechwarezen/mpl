import 'package:WINNER11/screen/component/darkmode.dart';
import 'package:WINNER11/utilis/AllColor.dart';
import 'package:WINNER11/utilis/borderbox.dart';
import 'package:WINNER11/utilis/boxSpace.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../service/authapi.dart';

class BannerAdd extends StatefulWidget {
  final List banners;
  late  int? currentSlide;

  BannerAdd({Key? key, required this.banners, required this.currentSlide})
      : super(key: key);

  @override
  State<BannerAdd> createState() => _BannerAddState();
}

class _BannerAddState extends State<BannerAdd> {
 
  @override
  Widget build(BuildContext context) {
    List<Widget> bannerWidgets = widget.banners.map<Widget>((banner) {
      return BannerWidget(imageUrl: banner["image"], uri: banner["url"]);
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 60.0,
            aspectRatio: 15 / 9,
            viewportFraction: 0.8,
            autoPlay: true,
            pageSnapping: true,
            initialPage: widget.currentSlide ?? 0,
            pauseAutoPlayInFiniteScroll: true,
            autoPlayCurve: Curves.easeInExpo,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            disableCenter: false,
            onPageChanged: (index, reason) {
              setState(() {
                // Make sure widget.currentSlide is non-null before assigning
                if (widget.currentSlide != null) {
                  widget.currentSlide = index;
                }
              });
            },
          ),
          items: bannerWidgets,
        ),
        size20h,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(
            bannerWidgets.length,
            (index) {
              return Container(
                width: 6,
                height: 6,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.currentSlide == index ? myColor : myColorWhite,
                  // Add border as needed
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class BannerWidget extends StatelessWidget {
  final String imageUrl;
  final String uri;
   final ThemeController themeController = Get.put(ThemeController());
  BannerWidget({required this.imageUrl, required this.uri});

  @override
  Widget build(BuildContext context) {
    return Obx(
  () =>
       Container(
        width: double.infinity,
      margin:  EdgeInsets.symmetric(
                          horizontal: 7, vertical: 7),
                      decoration: BoxDecoration(
                        border: border,
                        boxShadow: [  themeController.isLightMode.value ?  boxshadow2 : boxdark],
                        borderRadius: BorderRadius.circular(10),
                      ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            "https://mplproapi.techwarezen.co/images/${imageUrl}",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
