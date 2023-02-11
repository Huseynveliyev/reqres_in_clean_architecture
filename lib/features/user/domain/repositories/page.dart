import 'package:reqres_in_clean_architecture/features/user/domain/entities/page_entity.dart';

abstract class PageRepository {

  Future<PageEntity> getPageData({required int page});
}
