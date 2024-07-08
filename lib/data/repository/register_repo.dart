import 'package:clean_architecture_bloc/data/data_sources/remote/api_client.dart';
import 'package:clean_architecture_bloc/data/data_sources/remote/api_end_point_url.dart';
import 'package:dio/dio.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../presenatation/screen/Auth/Login/login_Model.dart';

class RegisterRepo extends ApiClient {
  //

  Future userRegister(
      {required String name,
      required String email,
      required String password}) async {
    Map body = {
      "name": name,
      "email": email,
      "password": password,
    };

    try {
      Response res = await postRequest(path: ApiEndPoints.register, body: body);

      if (res.statusCode == 200) {
        Map<String, dynamic> credentials = res.data;

        return credentials;
      }
    } on Exception catch (e) {
      Vx.log(e);
    }

    return LoginModel();
  }
}
