import 'package:test_case_can_creative/domain/failures/failures.dart';

const serverFailureMessage = "Oops, API Error. Please try again!";
const cacheFailureMessage = "Oops, cache failed. Please try again";
const defaultFailureMessage = 'Oops, something gone wrong. Please try again';

class FailureMessage {
  static String mapFailureToMessage(Failures failures) {
    if (failures is ServerFailure) {
      return failures.message;
    } else if (failures is CacheFailure) {
      return cacheFailureMessage;
    } else {
      return defaultFailureMessage;
}
}
}