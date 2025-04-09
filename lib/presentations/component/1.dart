// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:vespa_app/core/app/color_palette.dart';
// import 'package:vespa_app/core/app/constant.dart';
// import 'package:vespa_app/core/util/core_function.dart';
// import 'package:vespa_app/presentations/component/component.dart';
// import 'package:vespa_app/presentations/component/jumping_dots.dart';
// import 'package:vespa_app/presentations/drawing/controller/drawing_controller.dart';
// import 'package:vespa_app/presentations/hse/controller/hse_hand_over_controller.dart';
// import 'package:vespa_app/presentations/inventory/controller/inventory_detail_controller.dart';
// import 'package:vespa_app/presentations/inventory/controller/inventory_hand_over_controller.dart';
// import 'package:vespa_app/presentations/testing_termination/controller/testing_termination_controller.dart';
// import 'package:vespa_app/presentations/transport/controller/transport_controller.dart';
// import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// class ComponentDialog {
//   final inventoryDetailController = Get.find<InventoryDetailController>();
//   final drawingController = Get.put(DrawingController);
//   static loading() {
//     Get.dialog(
//       Dialog(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               const JumpingDots(),
//               const SizedBox(
//                 height: 20,
//               ),
//               Component.textBold("sedang memproses...", fontSize: 12, colors: ColorPalette.blackText)
//             ],
//           ),
//         ),
//       ),
//       barrierDismissible: false,
//     );
//   }

//   static success() {
//     Get.dialog(Dialog(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               Icons.check_circle_rounded,
//               color: ColorPalette.green2,
//               size: 70,
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Component.textBold("sukses menyimpan data", fontSize: 12, colors: ColorPalette.green2)
//           ],
//         ),
//       ),
//     ));
//   }

//   static image(File file) {
//     Get.dialog(Dialog(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [Image.file(file)],
//         ),
//       ),
//     ));
//   }

//   static Future<bool?> logout() {
//     return Get.dialog(
//       Dialog(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const SizedBox(
//                 height: 10,
//               ),
//               Component.textBold("Apakah anda yakin untuk keluar ?", textAlign: TextAlign.center),
//               const SizedBox(
//                 height: 30,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     flex: 1,
//                     child: InkWell(
//                       onTap: () => Get.back(result: false),
//                       child: Container(
//                         alignment: Alignment.center,
//                         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                         decoration: Component.shadow(color: ColorPalette.primary),
//                         child: Component.textDefault("Tidak", colors: ColorPalette.white),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                       child: Container(
//                     width: double.infinity,
//                   )),
//                   Expanded(
//                     flex: 1,
//                     child: InkWell(
//                       onTap: () => Get.back(result: true),
//                       child: Container(
//                         alignment: Alignment.center,
//                         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                         decoration: Component.shadow(color: ColorPalette.red),
//                         child: Component.textDefault("Ya", colors: ColorPalette.white),
//                       ),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     ).then((value) => value);
//   }

//   static Future<String?> datePicker({DateTime? minDate, String format = Constant.dateFormat}) async {
//     String? _selectedDate;
//     return Get.dialog(
//       Dialog(
//         insetPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Component.textBold("Pilih Tanggal"),
//               const SizedBox(
//                 height: 20,
//               ),
//               SfDateRangePicker(
//                 showNavigationArrow: true,
//                 onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
//                   String _dateCount = '';
//                   String _range = '';
//                   String _rangeCount = '';
//                   if (args.value is PickerDateRange) {
//                     _range = '${DateFormat(format).format(args.value.startDate)} -'
//                         ' ${DateFormat(format).format(args.value.endDate ?? args.value.startDate)}';
//                   } else if (args.value is DateTime) {
//                     _selectedDate = DateFormat(format).format(DateTime.parse(args.value.toString()));
//                   } else if (args.value is List<DateTime>) {
//                     _dateCount = args.value.length.toString();
//                   } else {
//                     _rangeCount = args.value.length.toString();
//                   }
//                   CoreFunction.logPrint("Selected Date", _selectedDate);
//                   CoreFunction.logPrint("Date Count", _dateCount);
//                   CoreFunction.logPrint("Range", _range);
//                   CoreFunction.logPrint("Range Count", _rangeCount);
//                 },
//                 selectionMode: DateRangePickerSelectionMode.single,
//                 minDate: minDate,
//                 maxDate: DateTime.now().add(Duration(days: 30)),
//               ),
//               InkWell(
//                 onTap: () => Get.back(result: _selectedDate),
//                 child: Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.symmetric(vertical: 10),
//                   margin: const EdgeInsets.symmetric(vertical: 10),
//                   decoration: BoxDecoration(color: ColorPalette.primary
//                       // border: Border.all(
//                       //   width: 1,
//                       //   color: ColorPalette.primary
//                       // )
//                       ),
//                   child: Component.textDefault("Pilih", colors: ColorPalette.white, textAlign: TextAlign.center, fontSize: 12),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     ).then((value) => value);
//   }

//   static Future<String?> timePicker() async {
//     String? selectedTime;
//     var pickedTime = await showTimePicker(
//       initialTime: TimeOfDay.now(),
//       context: Get.context!,
//     );
//     if (pickedTime != null) {
//       selectedTime = "${pickedTime.hour}:${pickedTime.minute}";
//     }
//     return selectedTime;
//   }

//   static Future<String?> timePickerDouble() async {
//     String? selectedTime;
//     var pickedTime = await showTimePicker(
//       initialTime: TimeOfDay.now(),
//       context: Get.context!,
//     );
//     if (pickedTime != null) {
//       // Ensure hour and minute are always two digits
//       final hour = pickedTime.hour.toString().padLeft(2, '0');
//       final minute = pickedTime.minute.toString().padLeft(2, '0');
//       selectedTime = "$hour:$minute";
//     }
//     return selectedTime;
//   }

//   static Future<bool?> checkDevelopeMode() {
//     return Get.dialog(
//       Dialog(
//         alignment: Alignment.center,
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(
//                 height: 10,
//               ),
//               Component.textBold("Please disable developer mode!", textAlign: TextAlign.center),
//               const SizedBox(
//                 height: 30,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   InkWell(
//                     onTap: () => SystemNavigator.pop(),
//                     child: Container(
//                       alignment: Alignment.center,
//                       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                       decoration: Component.shadow(color: ColorPalette.primary),
//                       child: Component.textDefault("OK", colors: ColorPalette.white),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//       barrierDismissible: false,
//     );
//   }

//   static Future<bool?> checkDifferenceTime() {
//     return Get.dialog(
//         Dialog(
//           alignment: Alignment.center,
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Component.textBold("Dont change your date and time", textAlign: TextAlign.center),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     InkWell(
//                       onTap: () => Get.back(result: true),
//                       child: Container(
//                         alignment: Alignment.center,
//                         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                         decoration: Component.shadow(color: ColorPalette.primary),
//                         child: Component.textDefault("OK", colors: ColorPalette.white),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//         barrierDismissible: false);
//   }

//   static Future<bool?> onApproval() {
//     return Get.dialog(
//       GetBuilder(
//         init: InventoryHandOverController(),
//         builder: (_) {
//           return Dialog(
//             alignment: Alignment.center,
//             child: Container(
//               height: 150,
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(bottom: 20),
//                       child: Text("Terima Tools ?"),
//                     ),
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         ElevatedButton(
//                           onPressed: _.onTerima,
//                           child: Text("Approve"),
//                         ),
//                         Spacer(),
//                         ElevatedButton(
//                           style: ButtonStyle(side: WidgetStatePropertyAll(BorderSide(width: 1, color: ColorPalette.primary)), backgroundColor: WidgetStatePropertyAll(ColorPalette.white)),
//                           onPressed: () => Get.back(),
//                           child: Text(
//                             "Cancel",
//                             style: TextStyle(color: ColorPalette.black),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//       barrierDismissible: true,
//     );
//   }

//   static Future<bool?> onReturn() {
//     return Get.dialog(
//       GetBuilder(
//         init: InventoryHandOverController(),
//         builder: (_) {
//           return Dialog(
//             alignment: Alignment.center,
//             child: Container(
//               height: 150,
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(bottom: 20),
//                       child: Text("Terima Kembali Tools ?"),
//                     ),
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         ElevatedButton(
//                           onPressed: _.onTerimaKembaliItems,
//                           child: Text("Approve"),
//                         ),
//                         Spacer(),
//                         ElevatedButton(
//                           style: ButtonStyle(side: WidgetStatePropertyAll(BorderSide(width: 1, color: ColorPalette.primary)), backgroundColor: WidgetStatePropertyAll(ColorPalette.white)),
//                           onPressed: () => Get.back(),
//                           child: Text(
//                             "Cancel",
//                             style: TextStyle(color: ColorPalette.black),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//       barrierDismissible: true,
//     );
//   }

//   static Future<bool?> endTechinician() {
//     return Get.dialog(
//       GetBuilder(
//         init: DrawingController(),
//         builder: (_) {
//           return Dialog(
//             alignment: Alignment.center,
//             child: Container(
//               height: 150,
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(bottom: 30),
//                       child: Text("Are you sure want to end the technician ?"),
//                     ),
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () => _.onRequestEnd(_.indexChoose),
//                           child: Text("End Request"),
//                         ),
//                         Spacer(),
//                         ElevatedButton(
//                           style: ButtonStyle(side: WidgetStatePropertyAll(BorderSide(width: 1, color: ColorPalette.primary)), backgroundColor: WidgetStatePropertyAll(ColorPalette.white)),
//                           onPressed: () => Get.back(),
//                           child: Text(
//                             "Cancel",
//                             style: TextStyle(color: ColorPalette.black),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//       barrierDismissible: true,
//     );
//   }

//   static Future<bool?> onActionHisory() {
//     return Get.dialog(
//       GetBuilder(
//         init: TransportController(),
//         builder: (_) {
//           return Dialog(
//             alignment: Alignment.center,
//             child: Container(
//               height: 150,
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(bottom: 20),
//                       child: Text("End Request transport ?"),
//                     ),
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () => _.onRequestEnd(_.indexChose),
//                           child: Text("End Request"),
//                         ),
//                         Spacer(),
//                         ElevatedButton(
//                           style: ButtonStyle(side: WidgetStatePropertyAll(BorderSide(width: 1, color: ColorPalette.primary)), backgroundColor: WidgetStatePropertyAll(ColorPalette.white)),
//                           onPressed: () => Get.back(),
//                           child: Text(
//                             "Cancel",
//                             style: TextStyle(color: ColorPalette.black),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//       barrierDismissible: true,
//     );
//   }

//   static Future<bool?> checkAttendance() {
//     return Get.dialog(
//         Dialog(
//           alignment: Alignment.center,
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Component.textBold("Anda harus melakukan absensi terlebih dahulu", textAlign: TextAlign.center),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     InkWell(
//                       onTap: () => Get.back(result: true),
//                       child: Container(
//                         alignment: Alignment.center,
//                         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                         decoration: Component.shadow(color: ColorPalette.primary),
//                         child: Component.textDefault("OK", colors: ColorPalette.white),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//         barrierDismissible: false);
//   }

//   static Future<bool?> endTechinicianTest() {
//     return Get.dialog(
//       GetBuilder<TestingTerminationController>(
//         init: TestingTerminationController(),
//         builder: (_) {
//           return Dialog(
//             alignment: Alignment.center,
//             child: ConstrainedBox(
//               constraints: BoxConstraints(
//                 maxWidth: MediaQuery.of(Get.context!).size.width * 0.8,
//                 maxHeight: MediaQuery.of(Get.context!).size.height * 0.5,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(bottom: 30),
//                       child: Text(
//                         "Are you sure want to end the technician?",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Expanded(
//                           child: ElevatedButton(
//                             onPressed: _.onRequestEnd,
//                             child: Text("End Request"),
//                           ),
//                         ),
//                         SizedBox(width: 10),
//                         Expanded(
//                           child: ElevatedButton(
//                             style: ButtonStyle(side: WidgetStatePropertyAll(BorderSide(width: 1, color: ColorPalette.primary)), backgroundColor: WidgetStatePropertyAll(ColorPalette.white)),
//                             onPressed: () => Get.back(),
//                             child: Text(
//                               "Cancel",
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//       barrierDismissible: true,
//     );
//   }

//   static Future<bool?> onTerimaKembaliHse() {
//     return Get.dialog(
//       GetBuilder(
//         init: HseHandOverController(),
//         builder: (_) {
//           return Dialog(
//             alignment: Alignment.center,
//             child: Container(
//               height: 150,
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(bottom: 20),
//                       child: Text("Terima Kembali Tools ?"),
//                     ),
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         ElevatedButton(
//                           onPressed: _.onReturn,
//                           child: Text("Approve"),
//                         ),
//                         Spacer(),
//                         ElevatedButton(
//                           style: ButtonStyle(side: WidgetStatePropertyAll(BorderSide(width: 1, color: ColorPalette.primary)), backgroundColor: WidgetStatePropertyAll(ColorPalette.white)),
//                           onPressed: () => Get.back(),
//                           child: Text(
//                             "Cancel",
//                             style: TextStyle(color: ColorPalette.black),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//       barrierDismissible: true,
//     );
//   }

//   static Future<bool?> endDriver() {
//     return Get.dialog(
//       GetBuilder(
//         init: TransportController(),
//         builder: (_) {
//           return Dialog(
//             alignment: Alignment.center,
//             child: Container(
//               height: 150,
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(bottom: 20),
//                       child: Text("End Request transport ?"),
//                     ),
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () => _.onRequestEndDriver(_.indexChose),
//                           child: Text("End Request"),
//                         ),
//                         Spacer(),
//                         ElevatedButton(
//                           style: ButtonStyle(side: WidgetStatePropertyAll(BorderSide(width: 1, color: ColorPalette.primary)), backgroundColor: WidgetStatePropertyAll(ColorPalette.white)),
//                           onPressed: () => Get.back(),
//                           child: Text(
//                             "Cancel",
//                             style: TextStyle(color: ColorPalette.black),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//       barrierDismissible: true,
//     );
//   }
// }
