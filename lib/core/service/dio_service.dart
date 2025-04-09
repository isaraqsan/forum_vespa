import 'dart:io';
import 'package:vespa_app/core/app/app_config.dart';
import 'package:vespa_app/core/app/enum.dart';
import 'package:vespa_app/core/util/core_function.dart';
import 'package:vespa_app/domain/model/response_api.dart';
import 'package:vespa_app/domain/model/response_api_2.dart';
import 'package:vespa_app/presentations/component/dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getx;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../domain/model/error_response.dart';
import '../../presentations/component/component.dart';
import 'auth_service.dart';
import 'env_service.dart';

class DioService extends getx.GetxService {
  final String methodPost = "POST";
  final String methodGet = "GET";
  final String methodPut = "PUT";
  final String methodPatch = "PATCH";
  final String methodDelete = "DELETE";

  Future<DioService> init() async {
    return this;
  }

  Future<Dio> setupDio(
    String method,
    String path,
    bool useToken, {
    bool loading = false,
    bool useSignature = true,
    bool showMessage = true,
    bool useInterceptorsWrapper = true,
  }) async {
    return await checkConnectivity().then((value) async {
      if (value) {
        final Dio dio = new Dio();
        dio.options = BaseOptions(
          baseUrl: EnvService.baseURL(),
          headers: header(useToken),
          connectTimeout: AppConfig.timeRequestApi,
          receiveTimeout: AppConfig.timeRequestApi,
          sendTimeout: AppConfig.timeRequestApi,
        );

        if (kDebugMode) {
          dio.interceptors.add(
            PrettyDioLogger(
              error: EnvService.debug,
              request: EnvService.debug,
              requestBody: EnvService.debug,
              requestHeader: EnvService.debug,
              responseBody: EnvService.debug,
              responseHeader: EnvService.debug,
              compact: EnvService.debug,
            ),
          );
        }
        // if (useInterceptorsWrapper) {
        dio.interceptors.add(
          InterceptorsWrapper(
            onRequest: onRequest,
            onResponse: useInterceptorsWrapper ? onResponse : onResponse2,
            onError: onError,
          ),
        );
        // }

        dio.options.extra["isLoading"] = loading;
        return dio;
      } else {
        Component.toast("No Internet", snackType: SnackType.Error);
        return Future.error("No Internet");
      }
    });
  }

  Future<bool> checkConnectivity() async {
    bool connect = false;
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 5));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connect = true;
      }
    } on SocketException catch (_) {
      connect = false;
    }
    return connect;
  }

  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    CoreFunction.logPrint("============= onRequest =============", "");
    if (AuthService.token.isNotEmpty)
      options.headers['X-Authorization'] = "Bearer " + AuthService.token;
    return handler.next(options);
  }

  Future<void> onResponse(Response? response, handler) async {
    CoreFunction.logPrint("============= onResponse =============", "");

    if (response?.statusCode == 200) {
      ResponseApi responseApi = ResponseApi.fromJson(response?.data);
      response?.data = responseApi;
      handler.next(response!);
    } else {
      return Future.error(Exception());
    }
  }

  Future<void> onResponse2(Response? response, handler) async {
    CoreFunction.logPrint("============= onResponse =============", "");

    if ((response?.statusCode ?? 500) < 300) {
      handler.next(response!);
    } else {
      Component.toast(
        "Sepertinya terdapat kesalahan pada server, silahkan coba beberapa saat lagi",
        snackType: SnackType.Error,
      );
    }
  }

  Future<void> onError(DioException e, ErrorInterceptorHandler handler) async {
    CoreFunction.logPrint("============= onError =============", "");

    CoreFunction.logPrint("Error Response", e.response);
    if (e.requestOptions.extra["isLoading"] == true) {
      getx.Get.back(closeOverlays: true);
    }

    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      CoreFunction.toast("Request Time Out",
          "Pastikan handphone anda memiliki koneksi internet");
    } else if (e.type == DioExceptionType.unknown) {
      CoreFunction.toast("Tidak dapat terhubung", "Hubungi Admin");
    } else if (e.type == DioExceptionType.badResponse) {
      CoreFunction.logPrint("Error Data", e.response.toString());
      ErrorResponse errorResponse = ErrorResponse.fromJson(e.response!.data);
      Component.toast(errorResponse.errors ?? errorResponse.message,
          snackType: SnackType.Error);
    } else {
      Component.toast("Terjadi kesalahan", snackType: SnackType.Error);
    }

    handler.next(e);
    throw e.message ?? "Terjadi kesalahan";
  }

  Future<ResponseApi> post(
      {required String url,
      Map<String, dynamic>? body,
      bool useToken = true,
      bool loading = false,
      bool showMessage = true}) async {
    var dio = await setupDio(methodPost, url, useToken,
        loading: loading, showMessage: showMessage);
    if (loading) {
      ComponentDialog.loading();
    }
    return await dio.post(url, data: body).catchError((error) {
      return error;
    }).then((value) {
      if (loading) {
        getx.Get.back();
      }
      return value.data;
    });
  }

  Future<ResponseApi> postArray({
    required String url,
    required List<dynamic> body, // Menerima array langsung
    bool useToken = true,
    bool loading = false,
    bool showMessage = true,
  }) async {
    var dio = await setupDio(methodPost, url, useToken,
        loading: loading, showMessage: showMessage);

    if (loading) {
      ComponentDialog.loading();
    }

    return await dio
        .post(url, data: body) // Mengirim array langsung
        .catchError((error) {
      return error;
    }).then((value) {
      if (loading) {
        getx.Get.back();
      }
      return value.data;
    });
  }

  Future<ResponseApi2> postFormData(
      {required String url,
      Map<String, dynamic>? body,
      bool useToken = true,
      bool loading = false,
      bool showMessage = true}) async {
    final formData = FormData.fromMap(body ?? {});
    var dio = await setupDio(methodPost, url, useToken,
        loading: loading, showMessage: showMessage);
    if (loading) {
      ComponentDialog.loading();
    }
    var response = await dio.post(url, data: formData);
    if (loading) {
      getx.Get.back();
    }
    return response.data;
  }

  Future<ResponseApi> put(
      {required String url,
      Map<String, dynamic>? body,
      bool useToken = true,
      bool loading = false}) async {
    if (loading) {
      ComponentDialog.loading();
    }
    var dio = await setupDio(methodPut, url, useToken);
    var response = await dio.put(url, data: body);
    if (loading) {
      getx.Get.back();
    }
    return response.data;
  }

  Future<bool> delete(
      {required String url,
      Map<String, dynamic>? body,
      bool useToken = true,
      bool loading = false}) async {
    if (loading) {
      ComponentDialog.loading();
    }
    var dio = await setupDio(methodDelete, url, useToken, loading: loading);
    var response = await dio.delete(
      url,
      data: body,
    );
    if (loading) {
      getx.Get.back();
    }
    return (response.statusCode ?? 500) < 300;
  }

  Future<ResponseApi> get({
    required String url,
    Map<String, dynamic>? body,
    bool useToken = true,
    Map<String, dynamic>? param,
    bool loading = false,
    bool showMessage = true,
  }) async {
    var dio = await setupDio(methodGet, url, useToken,
        loading: loading, showMessage: showMessage);
    if (loading) {
      ComponentDialog.loading();
    }
    var response = await dio.get(url, data: body, queryParameters: param);
    if (loading) {
      getx.Get.back();
    }
    return response.data;
  }

  Future download({
    required String url,
    Map<String, dynamic>? body,
    bool useToken = true,
    Map<String, dynamic>? param,
    bool loading = false,
    bool showMessage = true,
  }) async {
    var dio = await setupDio(methodGet, url, useToken,
        loading: loading,
        showMessage: showMessage,
        useInterceptorsWrapper: false,
        useSignature: true);
    if (loading) {
      ComponentDialog.loading();
    }
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    String filePath =
        '${appDocDirectory.path}/${url.split('/').last}_${DateTime.now().millisecondsSinceEpoch}.pdf';
    await dio.download(url, filePath, data: body, queryParameters: param);
    if (loading) {
      getx.Get.back();
    }
    return filePath;
  }

  Map<String, dynamic> header(bool isToken) {
    Map<String, dynamic> temp = {};
    if (EnvService.isProduction) {
      temp = {
        'Cache-Control': AppConfig.cacheControl,
        'Content-Type': AppConfig.contentType,
      };
    } else {
      temp = {
        'Cache-Control': AppConfig.cacheControl,
        'Content-Type': AppConfig.contentType,
      };
    }
    if (isToken) {
      temp.addAll({'Authorization': "Bearer " + AuthService.token});
      temp.addAll({
        'X-Requested-With': "XMLHttpRequest",
      });
    }
    return temp;
  }

  void appDebugPrint(Object message) {
    debugPrint(message.toString());
  }
}
