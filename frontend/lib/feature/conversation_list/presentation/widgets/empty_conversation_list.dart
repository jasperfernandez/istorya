import 'package:flutter/material.dart';

class EmptyConversationList extends StatelessWidget {
  const EmptyConversationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No conversations yet.',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      ),
    );
  }
}
