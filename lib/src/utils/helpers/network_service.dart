import 'package:docapp/src/services/restclient.dart';

abstract class NetworkService {
  RestClient rest;
  NetworkService(this.rest);
}
