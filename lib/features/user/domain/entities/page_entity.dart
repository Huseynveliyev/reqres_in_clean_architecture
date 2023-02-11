
import 'package:reqres_in_clean_architecture/features/user/domain/entities/user_entity.dart';

class PageEntity {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<UserEntity> data;


  PageEntity({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  
  });
}
