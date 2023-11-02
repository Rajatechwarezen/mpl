import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String baseUrl =
      'http://192.168.1.7:8000'; // Use "http" or "https" as needed
  final Dio dio = Dio();

  ApiService();

  Future<Map<String, dynamic>> userPostAllApi(
      {Map<String, dynamic>? data, uri}) async {
    final store = await SharedPreferences.getInstance();
    final token = store.getString("token");

    try {
      dio.options.baseUrl = baseUrl;
      dio.options.headers = {
        'Content-Type': 'application/json',
        'Authorization': uri == "/user_Login" ? token : "",
      };

      final response = await dio.post('$uri', data: data);

      if (response.statusCode == 200) {
        return {"data": response.data, "status": "200"};
      } else {
        return {"data": "nodata", "status": response.statusCode};
      }
    } catch (e) {
      throw Exception('Failed to make the API request: $e');
    }
  }

  userMatchList({Map<String, dynamic>? data, uri}) async {

    final store = await SharedPreferences.getInstance();
    final token = store.getString("token");

    try {
      dio.options.baseUrl = baseUrl;
      dio.options.headers = {
        'Content-Type': 'application/json',
        'Authorization': token,
      };

      final response = await dio.post('$uri', data: data);

      if (response.statusCode == 200) {
        return {"data": response.data, "status": "200"};
      } else {
        return {"data": "nodata", "status": response.statusCode};
      }
    } catch (e) {
      throw Exception('Failed to make the API request: $e');
    }
  }

  userallType({Map<String, dynamic>? data, uri}) async {
    final store = await SharedPreferences.getInstance();
    final token = store.getString("token");
  
    try {
      dio.options.baseUrl = baseUrl;
      dio.options.headers = {
        'Content-Type': 'application/json',
        'Authorization': token,
      };

      final response = await dio.post('$uri', data: data);

      if (response.statusCode == 200) {
    
        return {"data": response.data, "status": "200"};
      } else {
        return {"data": "nodata", "status": response.statusCode};
      }
    } catch (e) {
      throw Exception('Failed to make the API request: $e');
    }
  }

  userAllDoc({Map<String, dynamic>? data, uri}) async {
    final store = await SharedPreferences.getInstance();
    final token = store.getString("token");

    final id = store.getString("userId");
  
    try {
      dio.options.baseUrl = baseUrl;
      dio.options.headers = {
        'Content-Type': 'application/json',
        'Authorization': token,
      };

      final response = await dio.post('$uri', data: {"id": id});

      if (response.statusCode == 200) {
        return {"data": response.data, "status": "200"};
      } else {
        return {"data": "nodata", "status": response.statusCode};
      }
    } catch (e) {
      throw Exception('Failed to make the API request: $e');
    }
  }
  

userImageUpload({
  File? panImage,
  String? id,  // The ID you want to send
  String? url, // The upload URL
}) async {
      final store = await SharedPreferences.getInstance();
    final token = store.getString("token");
  final formData = FormData();
  print("${panImage} --- ${id} --- ${url}");
  // Add the 'id' parameter to the formData
  formData.fields.add(MapEntry('id', id ?? ''));

  if (panImage != null) {
    // Add the image file with 'file_name' as a required field
    formData.files.add(MapEntry(
      'image',
      await MultipartFile.fromFile(
        panImage.path,
      filename: "kycDocument.jpg"
      ),
    ));
  }

  try {


    dio.options.baseUrl = baseUrl;

    final response = await dio.post(
      url!,
      data: formData,
    );

    if (response.statusCode == 200) {
      return "ok";
    } else {
      return "not-ok";
    }
  } catch (e) {
    print('Error making the HTTP request: $e');
    return "not-ok";
  }
}

}
