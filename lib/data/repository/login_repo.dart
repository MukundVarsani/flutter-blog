import 'package:clean_architecture_bloc/data/data_sources/remote/api_client.dart';
import 'package:clean_architecture_bloc/data/data_sources/remote/api_end_point_url.dart';
import 'package:dio/dio.dart';

class LoginRepo extends ApiClient {
  //

  Future userLogin({required String email, required String password}) async {
    Map body = {
      "email": email,
      "password": password,
    };
    try {
      Response res = await postRequest(path: ApiEndPoints.login, body: body);

      if (res.statusCode == 200) {
        Map<String, dynamic> credentials = res.data;
        return credentials;
      } else {
        return res.data.message;
      }
    } on Exception catch (e) {
      // Vx.log(e);
      // print(e);
      return e;
    }
  }
}
