import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reqres_in_clean_architecture/features/user/domain/entities/page_entity.dart';
import 'package:reqres_in_clean_architecture/features/user/domain/entities/user_entity.dart';
import 'package:reqres_in_clean_architecture/injection/injection.dart';

import '../../domain/usecases/get_user_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  final GetUsersUseCase _getUsersUseCase = injection.get();
  int page = 1;
  List<UserEntity> users = [];
  getUsers() async {
    emit(UserLoading());
    try {
      final PageEntity result = await _getUsersUseCase(page);
      users = result.data;
      emit(UserSuccess(users));
    } catch (e) {
      emit(UserFailure(e.toString()));
    }
  }

  pagination() async {
    emit(UserLoading());
    page += 1;
    try {
      final PageEntity result = await _getUsersUseCase(page);
      for (var user in result.data) {
        users.add(user);
      }
      emit(UserSuccess(users));
    } catch (e) {
      emit(UserFailure(e.toString()));
    }
  }
}
