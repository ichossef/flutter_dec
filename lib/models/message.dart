enum MessageType {
  user,
  system,
  issue,
}

class Message {
  final String text;
  final MessageType type;
  final DateTime timestamp;
  final bool isIssue;

  Message({
    required this.text,
    required this.type,
    DateTime? timestamp,
    this.isIssue = false,
  }) : timestamp = timestamp ?? DateTime.now();

  @override
  String toString() {
    return 'Message{text: $text, type: $type, timestamp: $timestamp, isIssue: $isIssue}';
  }
}