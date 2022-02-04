import 'package:http/http.dart';

class HTTPClientImpl extends BaseClient {
  @override
  Future<StreamedResponse> send(BaseRequest request) {
    request.followRedirects = false;
    return request.send();
  }
}
