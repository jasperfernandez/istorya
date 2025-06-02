import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'common_providers.g.dart';

@riverpod
http.Client httpClient(Ref ref) => http.Client();

@riverpod
FlutterSecureStorage secureStorage(Ref ref) => const FlutterSecureStorage();
