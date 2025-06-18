abstract class Failure {
  final String message;
  const Failure(this.message);

  List<Object> get props => [message];
}

// Contoh failure khusus
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}
