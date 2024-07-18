abstract class IBaseApiResponse {
  final int statusCode;
  final String message;
  final bool isSuccess;
  final Map? result;
  IBaseApiResponse({
    required this.statusCode,
    required this.message,
    required this.isSuccess,
    required this.result,
  });
}

class SuccessApiResponse extends IBaseApiResponse {
  SuccessApiResponse._({
    required super.statusCode,
    required super.message,
    super.result,
    super.isSuccess = true,
  });
}

class FailureApiResponse extends IBaseApiResponse {
  FailureApiResponse._({
    required super.statusCode,
    required super.message,
    // ignore: unused_element
    super.result,
    super.isSuccess = false,
  });
}

class ResponseApiData {
  ResponseApiData._();

  static IBaseApiResponse success(responseData, int? statusCode) {
    var result = responseData;
    if (responseData is! Map<String, dynamic>) {
      if (responseData is List<dynamic>) {
        result = {
          'data': responseData,
        };
      }
    }
    return SuccessApiResponse._(
      statusCode: statusCode ?? 200,
      message: responseData['message'] ?? "Successo",
      isSuccess: responseData['isSuccess'],
      result: result,
    );
  }

  static IBaseApiResponse failure(responseData, int? statusCode) {
    responseData ??= {"message": "Ocorreu um problema"};
    return FailureApiResponse._(
      statusCode: statusCode ?? 500,
      message: responseData['message'] ?? "Falha",
      isSuccess: responseData['isSuccess'],
    );
  }
}
