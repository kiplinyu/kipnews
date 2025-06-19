
import '../../data/models/login_response_models.dart';

abstract class LoginRepository {
  Future<LoginResponseModel> login(String email, String password);
}
