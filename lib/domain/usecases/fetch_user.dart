import 'package:clean_arch/domain/entities/user.dart';
import 'package:clean_arch/domain/repositories/user_repositories.dart';

class FetchUsers {
  final UserRepository repository;

  FetchUsers(this.repository);

  Future<List<User>> call() async {
    return await repository.fetchUsers();
  }
}