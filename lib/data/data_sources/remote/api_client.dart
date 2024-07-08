import 'package:clean_architecture_bloc/data/data_sources/remote/api_constant.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:velocity_x/velocity_x.dart';
import 'api_exception.dart';

class ApiClient {
  late Dio dio;

  ApiClient() {
    final baseOptions = BaseOptions(baseUrl: ApiConstant.mainUrl);
    dio = Dio(baseOptions);
    // dio.interceptors.add(PrettyDioLogger());
  }

  // ----------------------------------GET REQUEST-------------------------

  Future<Response> getRequest({required String path, String? token}) async {
    var options = Options();

    if (token.isNotEmptyAndNotNull) {
      options = Options(
        headers: {"Authorization": "Bearer $token"},
      );
    }

    try {
      Response response = await dio.get(path, options: options);
      // print(response.statusCode);
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers.toString());
        print(e.response!.requestOptions);

        throw ApiException(message: e.response!.statusMessage);
      } else {
        print(e.requestOptions);
        print("------------>${e.message}");

        throw ApiException(message: e.message);
      }
    }
  }

  // -----------------------POST REQUEST----------------------------

  Future<Response> postRequest(
      {required String path, required dynamic body, String? token}) async {
    var options = Options();
    print(path);
    if (token.isNotEmptyAndNotNull) {
      options = Options(
        headers: {"Authorization": "Bearer $token"},
      );
    }

    try {
      Response response = await dio.post(path, data: body, options: options);
      print('response from api_client-------------->$response');
      return response;
    } on DioException catch (e) {
      print('error at post request $e');
      rethrow;
    }
  }
}

class API {
  Dio dio = Dio();

  API() {
    dio.options.baseUrl = "https://techblog.codersangam.com/api/";
    // dio.interceptors.add(PrettyDioLogger());
  }

  Dio get sendRequest => dio;
}
