class ApiConstants {
  static const String apiBaseUrl = "https://newsapi.org/";

  static const String getNews = "v2/top-headlines";
}

class ApiErrors {
  static const String badRequestError = "bad Request Error";
  static const String noContent = "no Content";
  static const String forbiddenError = "forbidden Error";
  static const String unauthorizedError = "unauthorized Error";
  static const String notFoundError = "not Found Error";
  static const String conflictError = "conflict Error";
  static const String internalServerError = "internal Server Error";
  static const String unknownError = "unknown Error";
  static const String timeoutError = "timeout Error";
  static const String defaultError = "default Error";
  static const String cacheError = "cache Error";
  static const String noInternetError = "no Internet Error";
  static const String loadingMessage = "loading message";
  static const String retryAgainMessage = "retry again message";
  static const String ok = "Ok";
}
