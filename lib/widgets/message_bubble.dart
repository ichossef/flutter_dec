import 'package:flutter/material.dart';
import '../models/message.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isUserMessage = message.type == MessageType.user;
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: isUserMessage 
            ? MainAxisAlignment.end 
            : MainAxisAlignment.start,
        children: [
          if (!isUserMessage) 
            const CircleAvatar(
              child: Icon(Icons.computer),
            ),
          const SizedBox(width: 8),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isUserMessage 
                  ? Colors.blue[300] 
                  : Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.text,
                  style: TextStyle(
                    color: isUserMessage ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _formatTime(message.timestamp),
                  style: TextStyle(
                    fontSize: 10,
                    color: isUserMessage 
                        ? Colors.white.withOpacity(0.7) 
                        : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          if (isUserMessage) 
            const CircleAvatar(
              child: Icon(Icons.person),
            ),
        ],
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}