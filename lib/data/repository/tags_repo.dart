import 'package:clean_architecture_bloc/data/data_sources/remote/api_client.dart';
import 'package:clean_architecture_bloc/data/data_sources/remote/api_end_point_url.dart';
import 'package:clean_architecture_bloc/presenatation/screen/general/tags/tags_model.dart';
import 'package:clean_architecture_bloc/utils/Utils.dart';
import 'package:dio/dio.dart';
import 'package:velocity_x/velocity_x.dart';

class TagsRepo extends ApiClient {
  TagsRepo();

  Future<List<Tags>> getAllTags() async {
    try {
      Response response = await getRequest(path: ApiEndPoints.tags);

      if (response.statusCode == 200) {
        List<dynamic> tagsMaps = response.data['tags'];
        return tagsMaps.map((tags) => Tags.fromJson(tags)).toList();
      }
    } on Exception catch (e) {
      rethrow;
    }

    return [Tags()];
  }

  Future<String> addNewTag(String title, String slug) async {
    final String token = await Utils.getToken();
    try {
      Map body = {'title': title, 'slug': slug};

      final Response res = await postRequest(
          path: ApiEndPoints.addTags, body: body, token: token);

      if (res.statusCode == 200) {
        Map resData = res.data;
        return resData['message'];
      }
    } catch (e) {
      Vx.log(e);
      rethrow;
    }

    return "Some error occurred while adding data";
  }

  Future<String> updateTag(String id, String title, String slug) async {
    final String token = await Utils.getToken();
    try {
      Map body = {
        'id': id,
        'title': title,
        'slug': slug,
      };

      final Response res = await postRequest(
          path: ApiEndPoints.updateTags, body: body, token: token);

      if (res.statusCode == 200) {
        Map resData = res.data;
        return resData['message'];
      }
    } catch (e) {
      Vx.log('error:-------------------->$e');
      rethrow;
    }

    return "Some error occurred while adding data";
  }

  Future<String> deleteTags(String id, int index, context) async {
    String resData;
    final String token = await Utils.getToken();
    try {
      final Response res = await postRequest(
          path: '${ApiEndPoints.deleteTags}/$id', body: null, token: token);

      Vx.log(res);

      if (res.statusCode == 200) {
        resData = res.data['message'];
        if (res.data['status'] == 1) {
          VxToast.show(context, msg: resData.toString());
        }
      }
    } catch (e) {
      Vx.log(e);
      // rethrow;
    }

    return "error";
  }
}

///
