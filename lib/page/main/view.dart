import 'package:flutter/material.dart';
import 'package:flutter_wan_android/config/constant.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MainPage extends StatelessWidget {
  final MainLogic logic = Get.put(MainLogic());
  final PageController pageController = PageController();

  void onTabClick(int index) => {logic.setIndex(index), pageController.jumpToPage(index)};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        children: Constant.mainTab.map((e) => e.tabPage).toList(),
        controller: pageController,
        onPageChanged: onTabClick,
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            elevation: 5,
            showUnselectedLabels: true,
            items: Constant.mainTab
                .map((e) => BottomNavigationBarItem(
                    icon: Icon(e.tabIcon), label: e.tabLabel))
                .toList(),
            currentIndex: logic.currentIndex.value,
            onTap: onTabClick,
          )),
    );
  }
}
