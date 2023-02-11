import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:reqres_in_clean_architecture/features/user/data/repositories/page_repo_imp.dart';
import 'package:reqres_in_clean_architecture/features/user/domain/repositories/page.dart';
import 'package:reqres_in_clean_architecture/features/user/domain/usecases/get_user_usecase.dart';
import '../features/user/data/datasources/page_data_source.dart';

GetIt injection = GetIt.instance;

Future<void> register() async {
  injection.registerSingleton(Dio());
  injection.registerFactory<PageDataSource>(() => PageDataSourceImpl());
  injection.registerFactory<PageRepository>(() => PageRepositoryImpl());
  injection.registerSingleton(GetUsersUseCase());
}
