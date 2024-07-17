class Failure {
  final String errorMessage;
  Failure([this.errorMessage = 'Something went wrong']);
}

class ServerException {
  final String message;
  ServerException({required this.message});
}
