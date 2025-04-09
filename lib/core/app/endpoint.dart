class Endpoint {
  //? Auth
  static const authLogin = "auth/login";
  static const authLogout = "auth/logout";

  //? User
  static const userAttendance = "user/attendance";
  static const userRequestAbsence = "user/request_absence";
  static const userProfile = "user/profile";
  static const userHistory = "user/history";
  static const userAbsenceHistory = "user/absence_history";
  static const userOvertimeCheck = "user/overtime";
  static const userOvertimeHistory = "user/overtime_history";
  static const userLogBookHistory = "user/logbook_history";
  static const userRequestLogbook = "user/request_logbook";
  static const userReimbursementHistory = "user/reimbursement_history";
  static const userReimbursementType = "user/reimbursement_type";
  static const userRequestReimbursement = "user/request_reimbursement";
  static const userTaskList = "user/task_list";
  static const userRequestForm = "user/request_form";
  static const userLeaveAllowance = "user/leave_allowance";
  static const userSubmitAbsence = "user/request_absence";
  static const userSubmitTask = "user/request_task";
  static const userUpdateTask = "user/update_task";
  static const userRequestList = "user/request_list";
  static const userRequestListDetail = "user/request_list_detail/:segment/:id";
  static const userRequestApprove = "user/request_approve";
  static const userRequestCalendar = "user/request_calender";
  static const userCalendarHistory = "user/calender_history";
  static const userPassword = "user/password";
  static const userRequestAttendance = "user/request_attendance";
  static const userAnnouncement = "user/create_announcement";

  //? Ref
  static const refRestrictLocation = "ref/restrict_location";
  static const refRestrictLocationCheckout = "ref/restrict_location_checkout";
  static const refAnnouncement = "ref/announcement";
  static const refReasonIjin = "ref/reason_ijin";
  static const refEmployeeCompany = "/ref/employee/company/:id";
  static const refSitebyCompany = "ref/site/company/:id";

  //? Trasnport
  static const transportHistory = "transport/history";
  static const transportLoanRequest = "transport/request";
  static const transportRequestItems = "transport/kendaraan";
  static const transportRequestList = "transport/request_list";
  static const transportDriver = "transport/driver";
  static const transportRequestApproval = "transport/request_approve";
  static const transportRequestEnd = "transport/request_end";
  static const transportHistoryDriver = "transport/driver_history";

  //? Testing & Termination
  static const testingTerminationHistory = "testing/history";
  static const testingTerminationRequest = "testing/request";
  static const testingTerminationTechnician = "testing/technician";
  static const testingTerminationTool = "testing/tool";
  static const testingTerminationRequestList = "testing/request_list";
  static const testingTerminationRequestApprove = "testing/request_approve";
  static const testingTerminationRequestBatal = "testing/request_batal";
  static const testingTerminationhistoryTechnician = "testing/technician_history";
  static const testingTerminationRequestEndTechnician = "testing/request_end";
  static const testingTerminationType = "testing/type";

  //? Drawing
  static const drawingHistory = "drawing/history";
  static const drawingType = "drawing/type";
  static const drawingRequestList = "drawing/request_list";
  static const drawingTechnician = "drawing/technician";
  static const drawingListDoc = "drawing/list?filter=document_size";
  static const drawingRequestType = "drawing/list?filter=drawing_status";
  static const drawingHistoryTechnician = "drawing/technician_history";
  static const drawingRequest = "drawing/request";
  static const drawingRequestApprove = "drawing/request_approve";
  static const drawingRequestEnd = "drawing/request_end";

  //? Inventory
  static const inventoryHistory = "inv/history";
  static const inventoryWarehouse = "/inv/gudang";
  static const inventoryCategory = "inv/kategori";
  static const inventoryType = "inv/jenis";
  static const inventoryToolWarehouse = "inv/tool_gudang";
  static const inventoryToolLoan = "inv/tool_pinjam";
  static const inventoryLoanList = "inv/request_pinjam_list";
  static const invetoryLoanRequest = "inv/request_pinjam";
  static const inventoryRequestApprove = "inv/request_approve";
  static const inventoryHandOver = "inv/serah_terima";
  static const inventoryExtendLoan = "inv/request_perpanjangan";

  //? photo
  static const photoVerify = "photo/verify/:id";

  //?history absen latihan
  static const absenHistoryList = "user/history";

  //libur
  static const HolidayHistoryList = "user/absence_history";

  //? HSE (Health Safety Environment)
  static const healthSafetyEnvironmentHistoryList = "hse/history";
  static const healthSafetyEnvironmentRequestList = "/hse/request_pinjam_list";
  static const healthSafetyEnvironmentLoanRequest = "hse/request_pinjam";
  static const healthSafetyEnvironmentMaster = "hse/master";
  static const healthSafetyEnvironmentApprove = "hse/request_approve";
  static const healthSafetyEnvironmentHandOver = "hse/serah_terima";
  static const healthSafetyEnvironmentRequestExtension = "hse/request_perpanjangan";
}
