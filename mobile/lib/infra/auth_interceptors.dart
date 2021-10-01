import 'package:dio/dio.dart';
import 'package:aqb_api/aqb_api.dart';

import 'account_local_data_source.dart';

class AuthInterceptors extends InterceptorsWrapper {
  final String _headerKey = authHeader.keys.first;

  final AccountService authService;
  final IAccountLocalDataSource authLocalDataSource;

  AuthInterceptors(
      {required this.authService, required this.authLocalDataSource});

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
    if (options.headers.containsKey(_headerKey)) {
      options.headers.remove(_headerKey);
      final accessToken = await authLocalDataSource.getAccessToken();
      if (accessToken != null) {
        options.headers.addAll({'Authorization': 'Bearer $accessToken'});
      }
    }

    return handler.next(options);
  }
}
