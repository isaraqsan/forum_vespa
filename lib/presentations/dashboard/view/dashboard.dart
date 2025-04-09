import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vespa_app/core/app/color_palette.dart';
import 'package:vespa_app/core/util/size_config.dart';
import 'package:vespa_app/presentations/add/view/add_view.dart';
import 'package:vespa_app/presentations/dashboard/controller/dashboard_controller.dart';
import 'package:vespa_app/presentations/profile/view/profile_view.dart';
import 'package:vespa_app/presentations/search/view/search_view.dart';

import '../../home/view/home_view.dart';
// import 'package:vespa_app/presentations/employee/view/employee_view.dart';
// import 'package:vespa_app/presentations/home/view/home_view.dart';
// import 'package:vespa_app/presentations/message/view/message_view.dart';
// import 'package:vespa_app/presentations/profile/view/profile_view.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key, this.page = 0}) : super(key: key);
  final int page;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) {
        return Scaffold(
            extendBody: true,
            resizeToAvoidBottomInset: false,
            body: PopScope(
              canPop: false,
              onPopInvokedWithResult: controller.onPopInvokedWithResult,
              child: NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  controller.updateBottomBarVisibility(notification.direction);
                  return true;
                },
                child: (() {
                  switch (controller.dashboardType) {
                    case DashboardType.Home:
                      return HomeView();
                    case DashboardType.Search:
                      return SearchView();
                      // return Container();
                    case DashboardType.Add:
                      return AddView();
                    case DashboardType.Message:
                      // return MessageView();
                      return Container();
                    case DashboardType.Profile:
                      return ProfileView();
                    // return Container();
                  }
                }()),
              ),
            ),
            // floatingActionButtonLocation:
            //     FloatingActionButtonLocation.centerDocked,
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {
            //     controller.onNavAttendance();
            //   },
            //   backgroundColor: ColorPalette.primary,
            //   child: Icon(
            //     Icons.add,
            //     color: ColorPalette.black,
            //   ),
            // ),
            bottomNavigationBar: Obx(
              () => AnimatedSlide(
                duration: Duration(milliseconds: 300),
                offset: controller.isBottomBarVisible.value
                    ? Offset(0, 0)
                    : Offset(0, 1),
                curve: Curves.easeInOut,
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: ColorPalette.primary,
                  unselectedFontSize: 12,
                  selectedFontSize: 12,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  unselectedItemColor: ColorPalette.white,
                  currentIndex: controller.dashboardType.index,
                  selectedItemColor: Colors.white,
                  onTap: (index) => controller.onChangeDashboard(index),
                  items: [
                    BottomNavigationBarItem(
                      activeIcon: Icon(
                        Icons.home_filled,
                        // color: ColorPalette.secondary,
                        size: 27,
                      ),
                      icon: Icon(
                        Icons.home_outlined,
                        color: ColorPalette.black,
                        size: 27,
                      ),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Icon(
                        Icons.search_outlined,
                        size: 27,
                      ),
                      icon: Icon(
                        Icons.search,
                        color: ColorPalette.black,
                        size: 27,
                      ),
                      label: "Search",
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Icon(
                        Icons.add,
                        size: 27,
                      ),
                      icon: Icon(
                        Icons.add_outlined,
                        color: ColorPalette.black,
                        size: 27,
                      ),
                      label: "Add",
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Icon(
                        Icons.message,
                        size: 27,
                      ),
                      icon: Icon(
                        Icons.message_outlined,
                        color: ColorPalette.black,
                        size: 27,
                      ),
                      label: "Message",
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Icon(
                        Icons.person,
                        size: 27,
                      ),
                      icon: Icon(
                        Icons.person_outline,
                        color: ColorPalette.black,
                        size: 27,
                      ),
                      label: "Profile",
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
