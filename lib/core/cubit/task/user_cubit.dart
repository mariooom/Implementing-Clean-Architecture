// lib/core/cubits/user_cubit.dart
import 'package:clean_arch/domain/entities/user.dart';
import 'package:clean_arch/domain/usecases/fetch_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final FetchUsers fetchUsers;
  List<User> users = [];

  UserCubit(this.fetchUsers) : super(UserInitial());

  void loadUsers() async {
    emit(UserLoading());
    try {
      users = await fetchUsers(); 
      emit(UserLoaded(users));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  void removeUser(User user) {
    users.remove(user); // Remove the user from the list
    emit(UserLoaded(List.from(users))); // Emit a new state with the updated list
  }
}