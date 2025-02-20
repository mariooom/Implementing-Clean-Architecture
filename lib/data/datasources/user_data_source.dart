import 'package:clean_arch/core/network/dio_client.dart';
import 'package:clean_arch/domain/entities/user.dart';

class UserRemoteDataSource {
  final DioClient _dioClient;

  UserRemoteDataSource(this._dioClient);

  Future<List<User>> fetchUsers() async {
    final response = await _dioClient.get('/users');
    final List<dynamic> data = response.data['users'];
    return data.map((user) => User.fromJson(user)).toList();
  }
}