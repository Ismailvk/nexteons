import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nexteons_test/constant/constand.dart';
import 'package:nexteons_test/model/temp_model.dart';

class ApiController extends GetxController {
  List<TempData> list = [];
  Dio dio = Dio();

  getData() async {
    final url = Uri.parse(Constants.getData);
    final Map<String, dynamic> bodyData = {
      "statusArray": [1],
      "screenType": [],
      "responseFormat": [],
      "globalGalleryIds": [],
      "categoryIds": [],
      "docTypes": [],
      "types": [],
      "limit": 10,
      "skip": 0,
      "searchingText": ""
    };
    final headers = {
      'Cache-Control': 'no-cache',
      'Postman-Token': '<calculated when request is sent>',
      'Content-Type': 'application/json',
      'Host': '<calculated when request is sent>',
      'User-Agent': 'PostmanRuntime/7.37.0',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Authorization': Constants.token
    };

    try {
      final response = await dio.post(
        url.toString(),
        data: bodyData,
        options: Options(headers: headers),
      );
      if (response.statusCode == 201) {
        var jsonData = response.data;
        List<dynamic> tempList = jsonData['data']['list'];
        print(' list is $tempList');
        list = tempList.map((item) => TempData.fromJson(item)).toList();
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}
