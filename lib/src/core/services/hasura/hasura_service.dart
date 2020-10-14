
import 'package:hasura_connect/hasura_connect.dart';
import '../../config/config_api.dart';

class HasuraService {
  static HasuraService _instance;

  HasuraConnect hasuraConnect = HasuraConnect(    
    "${ConfigApi.BASE_URL}",
    interceptors: [
      TokenInterceptor(),      
    ],
  );

  HasuraService._();
  
  factory HasuraService() {    
    _instance ??= HasuraService._();
    return _instance;
  }
}

class TokenInterceptor extends Interceptor {
  
  @override
  Future<void> onConnected(HasuraConnect connect) async {
    print('Hasura Connect');
  }

  @override
  Future<void> onDisconnected() async {
    print('Hasura Disconnect');
  }

  @override
  Future onError(HasuraError request) async {
    print('Hasura onError');
    return request;
  }

  @override
  Future<Request> onRequest(Request request) async {
    print('Hasura onRequest');
    return request;
  }

  @override
  Future onResponse(Response data) async {
    print('Hasura onResponse');
    return data;
  }

  @override
  Future<void> onSubscription(Request request, Snapshot snapshot) async {
    print('Hasura onSubscription');
  }

  @override
  Future<void> onTryAgain(HasuraConnect connect) async {
    print('Hasura onTryAgain');
  }
}