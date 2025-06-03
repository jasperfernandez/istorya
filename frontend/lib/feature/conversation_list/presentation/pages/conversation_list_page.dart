import 'package:flutter/material.dart';
import 'package:istorya/feature/conversation_list/presentation/widgets/empty_conversation_list.dart';

class ConversationListPage extends StatefulWidget {
  const ConversationListPage({super.key});

  @override
  State<ConversationListPage> createState() => _ConversationListPageState();
}

class _ConversationListPageState extends State<ConversationListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Istorya', style: Theme.of(context).textTheme.displaySmall),
      ),
      body: EmptyConversationList(),
      bottomNavigationBar: _buildBAB(),
    );
  }

  Widget _buildBAB() {
    return BottomAppBar(
      color: Theme.of(context).colorScheme.surface,
      child: Row(
        spacing: 64,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.message_outlined),
            onPressed: () {
              //
            },
          ),
          IconButton(
            icon: Icon(Icons.people_outline_outlined),
            onPressed: () {
              //
            },
          ),
          IconButton(
            icon: Icon(Icons.settings_outlined),
            onPressed: () {
              //
            },
          ),
        ],
      ),
    );
  }
}
