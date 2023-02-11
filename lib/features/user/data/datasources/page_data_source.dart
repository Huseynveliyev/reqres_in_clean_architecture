import 'package:dio/dio.dart';
import 'package:reqres_in_clean_architecture/features/user/data/models/page_res_model.dart';
import 'package:reqres_in_clean_architecture/injection/injection.dart';

import '../../../../core/shared/config/apiconfig.dart';

abstract class PageDataSource {
  Future<PageResponseModel> getPageData({required int page});
}

class PageDataSourceImpl extends PageDataSource {
  @override
  Future<PageResponseModel> getPageData({required int page}) async {
    final Dio dio = injection.get();
    dio.options.baseUrl = ApiConfig.baseUrl;
    try {
      var response = await dio.get(
        ApiConfig.userEndpoint,
        queryParameters: {"page": page},
      );
      return PageResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw (e.message);
    }
  }
}
