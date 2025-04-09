import 'package:get/get.dart';
import 'package:vespa_app/core/service/auth_service.dart';
import 'package:vespa_app/core/util/core_function.dart';
// import 'package:vespa_app/presentations/home/view/detail_announcement_view.dart';
// import 'package:vespa_app/presentations/home/model/announcement.dart';
import 'package:vespa_app/presentations/home/model/home_menu.dart';
import 'package:vespa_app/presentations/home/repository/home_repository.dart';
// import 'package:vespa_app/presentations/inventory/view/inventory_view.dart';
// import 'package:vespa_app/presentations/log_book/view/log_book_view.dart';
// import 'package:vespa_app/presentations/over_time/view/over_time_view.dart';
// import 'package:vespa_app/presentations/profile/controller/profile_controller.dart';
// import 'package:vespa_app/presentations/profile/repository/profile_repository.dart';
// import 'package:vespa_app/presentations/reimbursement/view/reimbursement_view.dart';
// import 'package:vespa_app/presentations/task/view/task_view.dart';
// import 'package:vespa_app/presentations/testing_termination/view/testing_termination_view.dart';
// import 'package:vespa_app/presentations/time_off/view/time_off_view.dart';
// import 'package:vespa_app/presentations/transport/view/transport_view.dart';
// import 'package:vespa_app/presentations/hse/view/hse_view.dart';
// import 'package:vespa_app/presentations/attendance/view/attendance_view.dart';
// import 'package:vespa_app/presentations/calendar/view/calendar_view.dart';
// import 'package:vespa_app/presentations/drawing/view/drawing_view.dart';
// import 'package:vespa_app/presentations/history/view/history_view.dart';

class HomeController extends GetxController with StateMixin<List<HomeMenu>> {
  // final HomeRepository homeRepository = HomeRepository();
  // ProfileRepository profileRepository = ProfileRepository();
  // final profileController = Get.put(ProfileController());
  String name = "";
  // final List<Announcement> listAnnounement = [];
  int indexChose = 0;

  final List<HomeMenuType> allowedMenuTypes = [
    HomeMenuType.Attendance,
    HomeMenuType.History,
    HomeMenuType.TimeOff,
    HomeMenuType.Task,
    HomeMenuType.Reimbursement,
    HomeMenuType.Calendar,
    HomeMenuType.Overtime,
    HomeMenuType.LogBook,
  ];

  final List<HomeMenu> listMenu = [
    HomeMenu(homeMenuType: HomeMenuType.Attendance, title: "Attendance", icon: "assets/icons/icmn_attendance.png"),
    HomeMenu(homeMenuType: HomeMenuType.History, title: "History", icon: "assets/icons/icmn_history.png"),
    HomeMenu(homeMenuType: HomeMenuType.TimeOff, title: "Time Off", icon: "assets/icons/icmn_time_off.png"),
    HomeMenu(homeMenuType: HomeMenuType.Task, title: "Task List", icon: "assets/icons/icmn_task_list.png"),
    HomeMenu(homeMenuType: HomeMenuType.Reimbursement, title: "Reimbursement", icon: "assets/icons/icmn_reimbursemen.png"),
    HomeMenu(homeMenuType: HomeMenuType.Calendar, title: "Calendar", icon: "assets/icons/icmn_calendar.png"),
    HomeMenu(homeMenuType: HomeMenuType.Overtime, title: "Overtime", icon: "assets/icons/icmn_overtime.png"),
    HomeMenu(homeMenuType: HomeMenuType.LogBook, title: "Log Book", icon: "assets/icons/icmn_log_book.png"),
  ];

  @override
  void onInit() {
    super.onInit();
    // onGetData();
    // onGetAnnouncements();
  }

  onGetData() async {
    name = AuthService.name;
    // await profileRepository.getProfileDatabase().then((value) {
    //   CoreFunction.logPrint("Data", value.toJson());
    // });
    change(listMenu, status: RxStatus.success());
  }

  // onAllMenu() async {
  //   listMenu.clear();
  //   listMenu.addAll([
  //     HomeMenu(homeMenuType: HomeMenuType.Attendance, title: "Attendance", icon: "assets/icons/icmn_attendance.png"),
  //     HomeMenu(homeMenuType: HomeMenuType.History, title: "History", icon: "assets/icons/icmn_history.png"),
  //     HomeMenu(homeMenuType: HomeMenuType.TimeOff, title: "Time Off", icon: "assets/icons/icmn_time_off.png"),
  //     HomeMenu(homeMenuType: HomeMenuType.Task, title: "Task List", icon: "assets/icons/icmn_task_list.png"),
  //     HomeMenu(homeMenuType: HomeMenuType.Reimbursement, title: "Reimbursement", icon: "assets/icons/icmn_reimbursemen.png"),
  //     HomeMenu(homeMenuType: HomeMenuType.Calendar, title: "Calendar", icon: "assets/icons/icmn_calendar.png"),
  //     HomeMenu(homeMenuType: HomeMenuType.Overtime, title: "Overtime", icon: "assets/icons/icmn_overtime.png"),
  //     HomeMenu(homeMenuType: HomeMenuType.LogBook, title: "Log Book", icon: "assets/icons/icmn_log_book.png"),
  //   ]);
  //   profileController.state?.features?.forEach((element) {
  //     if (element == "inventory") {
  //       listMenu.add(
  //         HomeMenu(
  //           homeMenuType: HomeMenuType.Inventory,
  //           title: "Inventory",
  //           icon: "assets/icons/icmn_log_book.png",
  //         ),
  //       );
  //     }
  //     if (element == "kendaraan") {
  //       listMenu.add(
  //         HomeMenu(homeMenuType: HomeMenuType.Transport, title: "Transport", icon: "assets/icons/icmn_transport.png"),
  //       );
  //     }
  //     if (element == "drawing") {
  //       listMenu.add(
  //         HomeMenu(homeMenuType: HomeMenuType.Drawing, title: "Drawing", icon: "assets/icons/icmn_drawing.png"),
  //       );
  //     }
  //     if (element == "testing") {
  //       listMenu.add(
  //         HomeMenu(homeMenuType: HomeMenuType.TestingTermination, title: "Test & Term", icon: "assets/icons/icmn_test_term.png"),
  //       );
  //     }
  //     if (element == "hse") {
  //       listMenu.add(
  //         HomeMenu(homeMenuType: HomeMenuType.HealthSafetyEnvironment, title: "HSE", icon: "assets/icons/icmn_hse.png"),
  //       );
  //     }
  //   });
  // }

  // onGetAnnouncements() async {
  //   await homeRepository.announcements().then((value) {
  //     listAnnounement.clear();
  //     listAnnounement.addAll(value);
  //     update();
  //   }, onError: (err) {});
  // }

  // onClickDetail(int index) async {
  //   indexChose = index;
  //   await Get.to(() => DetailAnnouncementView());
  // }

  // onClickMenu(HomeMenuType homeMenuType) {
  //   switch (homeMenuType) {
  //     case HomeMenuType.Attendance:
  //       Get.to(() => AttendanceView());
  //       break;
  //     case HomeMenuType.Calendar:
  //       Get.to(() => CalendarView(
  //             appointments: [],
  //           ));
  //       break;
  //     case HomeMenuType.TimeOff:
  //       Get.to(() => TimeOffView());
  //       break;
  //     case HomeMenuType.History:
  //       Get.to(() => HistoryView());
  //       break;
  //     case HomeMenuType.LogBook:
  //       Get.to(() => LogBookView());
  //     case HomeMenuType.Task:
  //       Get.to(() => TaskView());
  //       break;
  //     case HomeMenuType.Overtime:
  //       Get.to(() => OverTimeView());
  //       break;
  //     case HomeMenuType.Reimbursement:
  //       Get.to(() => ReimbursementView());
  //       break;
  //     case HomeMenuType.Transport:
  //       Get.to(() => TransportView());
  //       break;
  //     case HomeMenuType.Inventory:
  //       Get.to(() => InventoryView());
  //       break;
  //     case HomeMenuType.TestingTermination:
  //       Get.to(() => TestingTerminationView());
  //       break;
  //     case HomeMenuType.Drawing:
  //       Get.to(() => DrawingView());
  //       break;
  //     case HomeMenuType.HealthSafetyEnvironment:
  //       Get.to(() => HseView());
  //       break;
  //     default:
  //   }
  // }
}
