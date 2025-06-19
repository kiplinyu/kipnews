
import '../datasources/login_remote_data_source.dart';
import '../models/login_response_models.dart';
import '../../business/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDatasource remoteDatasource;

  LoginRepositoryImpl(this.remoteDatasource);

  @override
  Future<LoginResponseModel> login(String email, String password) {
    return remoteDatasource.login(email, password);
  }
}
