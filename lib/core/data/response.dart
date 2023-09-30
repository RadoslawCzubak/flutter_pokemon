import 'package:http/http.dart';

class NetworkResponse<T>{

  final int code;
  final T body;

  const NetworkResponse({required this.code, required this.body});

  static NetworkResponse<T> fromHttpResponse<T>(Response response, T parsedBody){
    return NetworkResponse(code: response.statusCode, body: parsedBody);
  }
}