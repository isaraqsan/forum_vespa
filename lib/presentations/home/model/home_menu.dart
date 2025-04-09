enum HomeMenuType {
  Attendance,
  Calendar,
  Drawing,
  History,
  Inventory,
  LogBook,
  Overtime,
  Task,
  TestingTermination,
  TimeOff,
  Transport,
  Report,
  Reimbursement,
  Schedule, 
  HealthSafetyEnvironment,
}

class HomeMenu {
  HomeMenuType homeMenuType;
  String title;
  String icon;

  HomeMenu({required this.homeMenuType, required this.title, required this.icon});
}
