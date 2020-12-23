import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:my_new_try/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeController homeController = HomeController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: controller.catListW.length,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              Get.isDarkMode
                  ? Get.changeTheme(ThemeData.light())
                  : Get.changeTheme(ThemeData.dark());
            },
            child: Get.isDarkMode ? Icon(Entypo.moon) : Icon(Feather.sun),
          ),
          appBar: TabBar(
            isScrollable: true,
            tabs: controller.catListW,
            labelColor: Colors.blue,//Get.isDarkMode ? Colors.black : Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.blue,
            labelStyle: TextStyle(fontSize: 20),
            unselectedLabelStyle: TextStyle(fontSize: 15),
          ),
          // centerTitle: true,

          body: Obx(
            () => Center(
              child: controller.pages.length != 7
                  ? CircularProgressIndicator()
                  : TabBarView(children: controller.pages),
            ),
          ),
        ),
      ),
    );
  }
}
