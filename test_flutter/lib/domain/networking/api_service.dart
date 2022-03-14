import 'package:chopper/chopper.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  static ApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://raw.githubusercontent.com/popina/test-flutter/',
      services: [_$ApiService()],
      converter: const JsonConverter(),
    );

    return _$ApiService(client);
  }

  @Get(path: 'main/data.json')
  Future<Response> getOrders();
}
