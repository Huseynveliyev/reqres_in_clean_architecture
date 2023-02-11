
import 'package:reqres_in_clean_architecture/features/user/data/models/user_res_model.dart';
import 'package:reqres_in_clean_architecture/features/user/domain/entities/page_entity.dart';



class PageResponseModel extends PageEntity {
  PageResponseModel({
    required super.page,
    required super.perPage,
    required super.total,
    required super.totalPages,
    required super.data,
  });
  factory PageResponseModel.fromJson(Map<String, dynamic> json) {
    return PageResponseModel(
      page: json['page'] as int,
      perPage: json['per_page'] as int,
      total: json['total'] as int,
      totalPages: json['total_pages'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => UserResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
     
    );
  }
}

