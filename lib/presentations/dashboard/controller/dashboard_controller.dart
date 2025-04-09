import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vespa_app/core/util/core_function.dart';
// import 'package:vespa_app/presentations/attendance/view/attendance_view.dart';

enum DashboardType { Home,Search, Add, Message, Profile,  }

class DashboardController extends GetxController {
  DateTime? backButtonPressTime;
  final snackBarDuration = const Duration(seconds: 3);
  DashboardType dashboardType = DashboardType.Home;
  var isBottomBarVisible = true.obs;

  void updateBottomBarVisibility(ScrollDirection direction) {
    if (direction == ScrollDirection.reverse) {
      isBottomBarVisible.value = false;
    } else if (direction == ScrollDirection.forward) {
      isBottomBarVisible.value = true;
    }
  }

  onChangeDashboard(int value) {
    switch (value) {
      case 0:
        dashboardType = DashboardType.Home;
        break;
      case 1:
        dashboardType = DashboardType.Search;
        break;
      case 2:
        dashboardType = DashboardType.Add;
        break;
      case 3:
        dashboardType = DashboardType.Message;
        break;
      case 4:
        dashboardType = DashboardType.Profile;
        break;
    }
    update();
  }

  onNavAttendance() {
    // Get.to(AttendanceView());
  }

  Future<void> onPopInvokedWithResult<T>(bool didPop, T? result) async {
    if (didPop) return;
    var canPop = await Navigator.canPop(Get.context!);

    final now = DateTime.now();
    final backButtonHasNotBeenPressedOrSnackBarHasBeenClosed =
        backButtonPressTime == null ||
            now.difference(backButtonPressTime!) > snackBarDuration;

    if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
      backButtonPressTime = now;
      CoreFunction.snackbar("Konfirmasi", "Tekan sekali lagi untuk keluar");
    } else {
      if (canPop) Get.back();
    }
  }
}
