import 'dart:async';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vespa_app/core/app/color_palette.dart';
import 'package:vespa_app/core/util/core_function.dart';

class NetworkService extends GetxService {
  static final NetworkService _singleton = NetworkService._internal();

  factory NetworkService() {
    return _singleton;
  }

  NetworkService._internal();

  bool isConnect = false;
  final _controller = StreamController<bool>.broadcast();
  Stream<bool> get connection => _controller.stream;
  final stream = Stream.periodic(const Duration(seconds: 30));

  @override
  void onInit() {
    super.onInit();
  }

  init() async {
    stream.listen(_updateConnectionStatus);
  }

  @override
  void onClose() {
    _controller.close();
    super.onClose();
  }

  setConnectiion(bool value) => _controller.sink.add(value);

  Future<void> _updateConnectionStatus(dynamic value) async {
    var responseConnection = await CoreFunction.checkConnectivity();
    CoreFunction.logPrint("Connection", responseConnection.toString());
    _controller.sink.add(responseConnection);
    if (responseConnection) {
      if (isConnect != responseConnection) CoreFunction.snackbar("Terhubung Ke Internet", "", backgroundColor: ColorPalette.green);
    } else {
      if (isConnect != responseConnection) CoreFunction.snackbar("Tidak ada Internet", "", backgroundColor: ColorPalette.red);
    }
    isConnect = responseConnection;
  }
}
