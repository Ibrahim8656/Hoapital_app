import 'package:dio/dio.dart';

class Diohelper{
  static late Dio dio;
  static init(){
    dio=Dio(
     BaseOptions(
      baseUrl:'https://fodail2011.pythonanywhere.com',
       headers: {
         'Content-Type': 'multipart/form-data',

         //'lang':'en'
       },
     ),

    );
  }

  static Future<Response> getdata({
    required String url,
     dynamic query,
  }) async {
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response<dynamic >> postdata(
      {
        required String url,
         required Map<String,dynamic> data
      }
      )async{
    return await dio.post(
      url,
      data: data,
    );
  }

}

