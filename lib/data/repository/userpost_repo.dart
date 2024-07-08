import 'package:clean_architecture_bloc/presenatation/screen/general/profile/user_post_model.dart';
import 'package:clean_architecture_bloc/utils/Utils.dart';
import 'package:dio/dio.dart';
import 'package:velocity_x/velocity_x.dart';
import '../data_sources/remote/api_client.dart';
import '../data_sources/remote/api_end_point_url.dart';

class UserPostRepo extends ApiClient {
  UserPostRepo();

  Future<UserPostModel> getAllUserPost() async {
    try {
      String token = await Utils.getToken();

      Response response =
          await getRequest(path: ApiEndPoints.userPost, token: token);

      if (response.statusCode == 200) {
        dynamic userPostsMap = response.data;

        return UserPostModel.fromMap(userPostsMap);
      }
    } on Exception catch (e) {
      Vx.log("getall post $e");
    }

    return UserPostModel();
  }
}
