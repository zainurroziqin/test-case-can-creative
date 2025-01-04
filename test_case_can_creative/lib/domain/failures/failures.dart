abstract class Failures {}

class ServerFailure extends Failures {
  final String message;
  ServerFailure({required this.message});
}

class CacheFailure extends Failures {}

class GeneralFailure extends Failures {}