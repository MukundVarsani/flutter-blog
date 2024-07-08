import 'package:clean_architecture_bloc/presenatation/screen/general/category/category_model.dart';
import 'package:dio/dio.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../utils/Utils.dart';
import '../data_sources/remote/api_client.dart';
import '../data_sources/remote/api_end_point_url.dart';

class CategoryRepo extends ApiClient {
  CategoryRepo();

  Future<List<Category>> getAllCategory() async {
    try {
      Response response = await getRequest(path: ApiEndPoints.categories);

      if (response.statusCode == 200) {
        List<dynamic> categoryMap = response.data['categories'];

        return categoryMap
            .map((category) => Category.fromJson(category))
            .toList();
      }
    } on Exception catch (e) {
      Vx.log('get ${e.toString()}');
      rethrow;
    }

    return [Category()];
  }

  Future<String> addNewTag(String title, String slug) async {
    final String token = await Utils.getToken();
    try {
      Map body = {'title': title, 'slug': slug};

      final Response res = await postRequest(
          path: ApiEndPoints.addCategories, body: body, token: token);

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
          path: ApiEndPoints.updateCategories, body: body, token: token);

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

  Future<String> deleteCategory(String id, int index, context) async {
    String resData;
    final String token = await Utils.getToken();
    try {
      final Response res = await postRequest(
          path: '${ApiEndPoints.deleteCategories}/$id',
          body: null,
          token: token);

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
