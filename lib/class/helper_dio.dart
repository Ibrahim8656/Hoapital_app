import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        //Here the URL of API.
        baseUrl: "https://fodail2011.pythonanywhere.com",
        receiveDataWhenStatusError: true,
        //Here we Put The Headers Needed in The API.
        headers: {
          'Content-Type':'application/json',
          'Content-Length': '<calculated when request is sent>',
          'Host': '<calculated when request is sent>',
          'Accept': '*/*',
          'Accept-Encoding': 'gzip, deflate, br',
          //'lang':'en'
        },
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onReceiveProgress,
    String? token,
  }) async {
    try {
      print("token $token");

      dio.options.headers = {
        'Content-Type': 'application/json',
        //'Token': token,
        // 'Authorization': token ,
        'device_token': token ?? '',
      };
      final Response response = await dio.get(
        "baseUrl2+url",
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
  //This Function that's Used To Post Data to API based on URL(End Points) and Headers.
  // login register task
  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      print("dio.options $url");

      dio.options.headers = {
        'Content-Type': 'application/json',
        //'device_token': token ?? '',
        'Authorization': token,
      };
      final Response response = await dio.post(
        "baseUrl+url",
        data: data,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      print("response:$response");
      return response;
    } catch (e) {
      rethrow;
    }
  }
  //This Function That's Used to Update Some Date based on URL(End Points) and Send what's you need to Update as Map.
  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? data,
    required String? token,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      dio.options.headers = {
        'Content-Type': 'application/json',
        'Authorization': token,
      };
      final Response response = await dio.put(
        "baseUrl+ url",
        data: data,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //This Function That's Used to Update Some Date based on URL(End Points) and Send what's you need to Update as Map.
  static Future<Response> patchData({
    required String url,
    required Map<String, dynamic> data,
    required String token,
    bool files = false,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
      //'Content-Type': 'application/json',
    };
    return await dio.patch(
      "baseUrl+url",
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    required String token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    try {
      final Response response = await dio.delete(
        "baseUrl+ url",
        data: data,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

}
