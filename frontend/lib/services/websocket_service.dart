import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/services/secure_storage_service.dart';
import 'package:simple_flutter_reverb/simple_flutter_reverb.dart';
import 'package:simple_flutter_reverb/simple_flutter_reverb_options.dart';

/// WebSocketService manages communication with the Reverb WebSocket service.
class WebSocketService {
  // SecureStorageService instance to retrieve access tokens for authentication
  final _secureStorageService = SecureStorageService();

  // FlutterReverb instance for managing WebSocket connections
  late final SimpleFlutterReverb _flutterReverb;

  /// Constructor to initialize the WebSocketService
  /// Sets up the FlutterReverb with the required configuration
  WebSocketService() {
    // Creating an options object for Reverb WebSocket connection
    final SimpleFlutterReverbOptions options = SimpleFlutterReverbOptions(
      // Reading environment variables from .env file for Reverb configuration
      scheme: dotenv.env['REVERB_SCHEME']!,
      host: dotenv.env['REVERB_HOST']!,
      port: dotenv.env['REVERB_PORT']!,
      appKey: dotenv.env['REVERB_APP_KEY']!,
      authUrl:
          dotenv
              .env['REVERB_AUTH_URL']!, // URL for authentication (private channels) (Documentation: https://laravel.com/docs/11.x/broadcasting#authorizing-channels)
      privatePrefix: 'private-', // Prefix for private channels (Laravel default prefix is 'private-')
      // Retrieving the access token from secure storage for authentication
      authToken: _secureStorageService.read('auth_token'),
    );

    // Initializing FlutterReverb with the provided options
    _flutterReverb = SimpleFlutterReverb(options: options);
  }

  /// Listens to a public channel and calls the onData callback with the received data.
  ///
  /// [onData] - A callback function that will be invoked with the data from the channel.
  /// [channel] - The name of the public channel to listen to.
  void listenPublicChannel(void Function(dynamic) onData, String channel) {
    // Subscribing to the public channel
    _flutterReverb.listen(onData, channel);
  }

  /// Listens to a private channel and calls the onData callback with the received data.
  ///
  /// [onData] - A callback function that will be invoked with the data from the channel.
  /// [channel] - The name of the private channel to listen to.
  void listenPrivateChannel(void Function(dynamic) onData, String channel) {
    // Subscribing to the private channel by passing `isPrivate: true`
    _flutterReverb.listen(onData, channel, isPrivate: true);
  }

  void close() {
    _flutterReverb.close();
  }
}
