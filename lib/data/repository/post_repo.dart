import 'package:clean_architecture_bloc/data/data_sources/remote/api_end_point_url.dart';
import 'package:clean_architecture_bloc/presenatation/screen/general/home/posts_model.dart';
import 'package:clean_architecture_bloc/utils/Utils.dart';
import 'package:dio/dio.dart';
import 'package:clean_architecture_bloc/data/data_sources/remote/api_client.dart';
import 'package:velocity_x/velocity_x.dart';

class PostRepo extends ApiClient {
  Future<List<PostModel>> getAllPost() async {
    try {
      Response res = await getRequest(path: ApiEndPoints.posts);

      Vx.log(res);
      if (res.statusCode == 200) {
        List<dynamic> postMaps = res.data['popular_posts'];
        return postMaps.map((tags) => PostModel.fromJson(tags)).toList();
      }
    } catch (e) {
      Vx.log("getallpost $e");
      rethrow;
    }
    return [PostModel()];
  }

  Future addPost(
    String title,
    String slug,
    String categories,
    String tags,
    String body,
    String status,
    String user_id,
    String filePath,
    String fileName,
  ) async {
    final formData = FormData.fromMap({
      'title': title,
      'slug': slug,
      'categories': categories,
      'tags': tags,
      'body': body,
      'status': status,
      'user_id': user_id,
      'featuredimage':
          await MultipartFile.fromFile(filePath, filename: fileName),
    });
    final token = await Utils.getToken();

    try {
      Response res = await postRequest(
          path: ApiEndPoints.addPost, body: formData, token: token);

      if (res.statusCode == 200) {
        Map postMaps = res.data;
        return postMaps;
      }
    } catch (e) {
      Vx.log("addPost $e");
      rethrow;
    }
  }
}
