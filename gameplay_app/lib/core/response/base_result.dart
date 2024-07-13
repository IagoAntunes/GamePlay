abstract class BaseResult {
  String message;
  BaseResult({
    required this.message,
  });
}

class SuccessResult extends BaseResult {
  final bool isSuccess;
  final Map? result;
  SuccessResult._({
    required this.isSuccess,
    required this.result,
    required super.message,
  });
}

class FailureResult extends BaseResult {
  final bool isSuccess;
  FailureResult._({
    required this.isSuccess,
    required super.message,
  });
}

class ResultData {
  static BaseResult success(responseData) {
    return SuccessResult._(
      message: responseData.message,
      isSuccess: responseData.isSuccess,
      result: responseData.result,
    );
  }

  static BaseResult failure(responseData) {
    return FailureResult._(
      message: responseData.message,
      isSuccess: responseData.isSuccess,
    );
  }
}
