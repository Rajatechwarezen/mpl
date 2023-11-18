import 'package:WINNER11/screen/component/coundown.dart';
import 'package:WINNER11/screen/component/custom_toaster.dart';
import 'package:WINNER11/screen/component/darkmode.dart';
import 'package:WINNER11/screen/component/shimmer.dart';
import 'package:WINNER11/screen/header/headerTop.dart';
import 'package:WINNER11/screen/tap1/upcomming.dart';
import 'package:WINNER11/screen/tap3/blog_model.dart';
import 'package:WINNER11/service/authapi.dart';
import 'package:WINNER11/utilis/AllColor.dart';
import 'package:WINNER11/utilis/borderbox.dart';
import 'package:WINNER11/utilis/boxSpace.dart';
import 'package:WINNER11/utilis/fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YourWidget extends StatefulWidget {
  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
var _liveBlog = [];
  int _page = 1; // Track the current page of data
  bool _isLoading = false; // Track whether new data is being loaded
  final ScrollController _scrollController = ScrollController();

  final ThemeController themeController = Get.put(ThemeController());
  @override
  void initState() {
    super.initState();
    _loadData();

    // Listen to scroll events
    _scrollController.addListener(() {
      // Check if the user has reached the end of the list
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // Load more data when the end is reached
        _loadMoreData();
      }
    });
  }

  Future<void> _loadData() async {
    // Set _isLoading to true to show the loading indicator
    setState(() {
      _isLoading = true;
    });
    final ApiService apiService = ApiService();

    try {
      final response = await apiService.userAllDoc(uri: "/show_matches?page=$_page");
      if (response != null) {
         var newsList =
            (response as Map<String, dynamic>)['data']["result"];


        // Clear the existing list when loading new data
        _liveBlog.clear();
          _liveBlog.add(newsList);
        

        setState(() {
          // Update the UI with the new data
          _isLoading = false; // Set _isLoading to false after data is loaded
        });
      } else {
        throw Exception('Failed to fetch news list');
      }
    } catch (error) {
      print('Error: $error');
      setState(() {
        _isLoading = false; // Set _isLoading to false in case of an error
      });
    }
  }

  Future<void> _loadMoreData() async {
    // Return if data is already being loaded
    if (_isLoading) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    _page++; // Increment the page number
    await _loadData();
  }

  @override
  Widget build(BuildContext context) {

    print("-----------${_liveBlog}");
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App'),
      ),
      body: Column(
        children: [
             Simpletitlebtn(HeadName: " Matche  News"),
            size20h,   Expanded(
            child: ListView.builder(
              itemCount: _liveBlog[0].length,
              itemBuilder: (context, index) {
              },
              controller: _scrollController,
            ),
          ),
          // Show a loading indicator when new data is being loaded
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
