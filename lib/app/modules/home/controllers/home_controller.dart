import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_new_try/stless/my_staggred.dart';
import 'package:url_launcher/url_launcher.dart';

import '../catagori_model.dart';

class HomeController extends GetxController {
  // final count = 0.obs;

  RxList<Widget> pages = <Widget>[].obs;
  List<String> catList = [
    'general',
    'sport',
    'business',
    'technology',
    'entertainment',
    'health',
    'science',

  ];
  List<Widget> catListW = [
    Tab(text: 'General'),
    Tab(text: 'Sport'),
    Tab(text: 'Business'),
    Tab(text: 'Technology'),
    Tab(text: 'Entertainment'),
    Tab(text: 'Health'),
    Tab(text: 'Science'),
  ];
  //  myRxCategory;

  Future<Category> getNewsByCat(String cat) async {
    http.Response response = await http.get(
        'http://newsapi.org/v2/top-headlines?category=$cat&apiKey=????API-KEY????');
    if (response.statusCode == 200) {
      var resbody = jsonDecode(response.body);
      Category myRxCategory = Category.fromJson(resbody);
      print(myRxCategory.articles[0].title);
      return myRxCategory;
    }
    print('massion faild');
  }
  Future<void> muLuncher(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  void onInit() async {
    for (String i in catList) {
      await getNewsByCat(i).then(
        (value) {
          print(value);
          pages.add(
            MyStragged(
              data: value,
            ),
          );
        },
      );
    }
  }

  @override
  void onReady() {}
  @override
  void onClose() {}
  // void increment() => count.value++;
}
