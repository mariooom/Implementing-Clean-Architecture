import 'package:clean_arch/data/datasources/user_data_source.dart';
import 'package:clean_arch/domain/entities/user.dart';
import 'package:clean_arch/domain/repositories/user_repositories.dart';
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<User>> fetchUsers() async {
    return await remoteDataSource.fetchUsers();
  }
}