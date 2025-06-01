import 'package:eko/eko.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:istorya/models/message_model.dart';
import 'package:istorya/services/websocket_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Istorya', theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)), home: const HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late WebSocketService _webSocketService;
  bool _isLoading = true;
  final List<String> _messages = [];

  Future<void> _initWebSocket() async {
    final service = WebSocketService();

    service.listenPrivateChannel((data) {
      setState(() {
        if (data is WebsocketResponse) {
          final eventData = data.data;
          final event = data.event;
          debugPrint('WebsocketResponse: Event: $event Event Data: $eventData');

          if (event == 'App\\Events\\MessageSent' && eventData != null) {
            final message = MessageModel.fromMap(eventData);
            debugPrint('MessageSent Data: $message');
            _messages.add(message.content);
          }
        }
      });
    }, 'conversation.1');

    setState(() {
      _webSocketService = service;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _initWebSocket();
  }

  @override
  void dispose() {
    _webSocketService.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Istorya')),
      body: ListView.builder(
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(_messages[index]));
        },
      ),
    );
  }
}
