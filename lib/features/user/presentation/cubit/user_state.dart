part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final List<UserEntity> result;

  const UserSuccess(this.result);
}

class UserFailure extends UserState {
  final String message;

  const UserFailure(this.message);
}
