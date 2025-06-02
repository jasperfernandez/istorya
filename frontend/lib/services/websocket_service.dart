import 'package:eko/eko.dart';
import 'package:eko/eko_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class IWebSocketService {
  void listenPublicChannel(void Function(dynamic) onData, String channel);
  void listenPrivateChannel(void Function(dynamic) onData, String channel);
  void close();
}

class WebSocketService implements IWebSocketService {
  // final _secureStorageService = SecureStorageService();

  late final Eko _eko;

  WebSocketService() {
    final EkoOptions options = EkoOptions(
      scheme: dotenv.env['REVERB_SCHEME']!,
      host: dotenv.env['REVERB_HOST']!,
      port: dotenv.env['REVERB_PORT']!,
      appKey: dotenv.env['REVERB_APP_KEY']!,
      authUrl: dotenv.env['REVERB_AUTH_URL']!,
      privatePrefix: 'private-',
      // authToken: _secureStorageService.read('auth_token'),
      authToken: '2|z1yfi7Qh2ApEU6imLWwICz6XxIMlUvwnyKnW8jHH703dfcb7',
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
