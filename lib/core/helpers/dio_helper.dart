import 'package:blue_book/core/constants/constants.dart';
import 'package:dio/dio.dart';

class DioHelper {
  final Dio _dio = Dio(
    BaseOptions(
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      baseUrl: EndPoints.baseUrl,
    ),
  );

  Future<ResponseData> post({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    try {
      
      final response = await _dio.post(
        endPoint,
        data: data,
      );

      return ResponseData(
        message: "Login Successfull",
        isSuccess: true,
        response: response,
      );
    
    } on DioException catch (ex) {
      return ResponseData(
        message: ex.response?.data.toString() ?? "NOt Connected!",
        isSuccess: false,
        response: ex.response,
      );
    }
  }

  Future<ResponseData> getData({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    try {

      var response = await _dio.get(endPoint, queryParameters: data);
      return ResponseData(
        message: '',
        isSuccess: true,
        response: response,
      );
  
  
    } on DioException catch (ex) {
      return ResponseData(
        message: ex.response?.data.toString() ?? "Not Connected!",
        isSuccess: false,
        response: ex.response,
      );
    }
  }
}

class ResponseData {
  late final String message;
  late final bool isSuccess;
  late final Response? response;

  ResponseData({required this.message, required this.isSuccess, this.response});
}
