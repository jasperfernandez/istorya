import 'package:eko/eko.dart';
import 'package:eko/eko_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:istorya/core/constants/app_constants.dart';

abstract class ISocketService {
  void listenPublicChannel(void Function(dynamic) onData, String channel);
  void listenPrivateChannel(void Function(dynamic) onData, String channel);
  void close();
}

class SocketService implements ISocketService {
  final FlutterSecureStorage storage;

  late final Eko _eko;

  SocketService(this.storage) {
    final EkoOptions options = EkoOptions(
      scheme: dotenv.env['REVERB_SCHEME']!,
      host: dotenv.env['REVERB_HOST']!,
      port: dotenv.env['REVERB_PORT']!,
      appKey: dotenv.env['REVERB_APP_KEY']!,
      authUrl: dotenv.env['REVERB_AUTH_URL']!,
      privatePrefix: 'private-',
      authToken: storage.read(key: AppConstants.tokenKey),
    );

    _eko = Eko(options: options);
  }

  @override
  void listenPublicChannel(void Function(dynamic) onData, String channel) {
    _eko.listen(onData, channel);
  }

  @override
  void listenPrivateChannel(void Function(dynamic) onData, String channel) {
    _eko.listen(onData, channel, isPrivate: true);
  }

  @override
  void close() {
    _eko.close();
  }
}
