import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';

class AuthenticationInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      data.params['api_key'] = dotenv.get('API_KEY');
      data.headers["Content-Type"] = "application/json";
    } catch (e) {
      ///print exception
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async =>
      data;
}
