import 'package:reqres_in_clean_architecture/features/user/domain/entities/page_entity.dart';
import 'package:reqres_in_clean_architecture/features/user/domain/repositories/page.dart';
import 'package:reqres_in_clean_architecture/injection/injection.dart';

import '../datasources/page_data_source.dart';

class PageRepositoryImpl extends PageRepository {
  final PageDataSource _pageDataSource = injection.get();
  @override
  Future<PageEntity> getPageData({required int page}) async{
    return await _pageDataSource.getPageData(page: page);
  }
}
