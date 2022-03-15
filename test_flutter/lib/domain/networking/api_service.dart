import 'package:chopper/chopper.dart';
import 'package:test_flutter/config/app_config.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  static ApiService create() {
    final client = ChopperClient(
      baseUrl: AppConfig.baseURL,
      services: [_$ApiService()],
      converter: const JsonConverter(),
    );

    return _$ApiService(client);
  }

  @Get(path: 'main/data.json')
  Future<Response> getOrders();
}
