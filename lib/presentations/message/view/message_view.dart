import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vespa_app/core/util/size_config.dart';
import 'package:vespa_app/presentations/component/bottomsheet.dart';
// import 'package:vespa_app/presentations/employee/view/employee_view.dart';

class MessageView extends StatelessWidget {
  MessageView({Key? key, this.page = 0}) : super(key: key);
  final int page;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // Tampilkan bottomSheet setelah frame pertama selesai dibuild
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ComponentBottomsheet.upcoming();
    });

    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(), // atau kosongin aja, gak masalah
    );
  }
}
