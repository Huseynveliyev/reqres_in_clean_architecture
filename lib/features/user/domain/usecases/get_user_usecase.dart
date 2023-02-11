import 'package:reqres_in_clean_architecture/core/shared/domain/usecase/usercase.dart';
import 'package:reqres_in_clean_architecture/features/user/domain/entities/page_entity.dart';
import 'package:reqres_in_clean_architecture/features/user/domain/repositories/page.dart';
import 'package:reqres_in_clean_architecture/injection/injection.dart';

class GetUsersUseCase extends UseCase<int, PageEntity> {
  final PageRepository _pageRepository = injection.get();
  @override
  Future<PageEntity> call(int params) {
    return _pageRepository.getPageData(page: params);
  }
}
