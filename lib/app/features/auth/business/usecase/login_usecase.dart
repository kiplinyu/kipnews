
import '../entities/user_entity.dart';
import '../repositories/login_repository.dart';

class LoginUsecase {
  final LoginRepository repository;

  LoginUsecase({required this.repository});

  Future<UserEntity> execute(String email, String password) async {
    final result = await repository.login(email, password);
    return UserEntity(
      id: result.author.id,
      email: result.author.email,
      name: "${result.author.firstName} ${result.author.lastName}",
      token: result.token,
    );
  }
}
