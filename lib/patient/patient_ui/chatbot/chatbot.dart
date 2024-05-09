
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../../sheared/components/comopnents.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _Chatbot();
}

class _Chatbot extends State<Chatbot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("healthera "),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: const ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final GenerativeModel _model;
  late final ChatSession _chat;
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _loading = false;

  @override
  void initState() {
    _model = GenerativeModel(model: "gemini-pro", apiKey: dotenv.env['API_KEY']!);
    _chat = _model.startChat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool hasApiKey = dotenv.env['API_KEY'] != null && dotenv.env['API_KEY']!.isNotEmpty;
    return Stack(

      children: [
      SingleChildScrollView(
        child: Image.network(
          'https://img.freepik.com/premium-photo/human-helix-dna-structure-concept-blue-color-ai-generated_444663-845.jpg?w=740',

          fit:BoxFit.cover,height: 1000 ,width: double.infinity,
        ),
      ),
        Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Expanded(
    child: hasApiKey
    ? ListView.builder(
    controller: _scrollController,
    itemBuilder: (context, idx) {
    final content = _chat.history.toList()[idx];
    final text = content.parts.whereType<TextPart>().map<String>((e) => e.text).join('');
    return MessageWidget(
    text: text,
    isFromUser: content.role == 'user',
    );
    },
    itemCount: _chat.history.length,
    )
        : ListView(
    children: const [
    Text('No API key found. Please provide an API Key.'),
    ],
    ),
    ),
    Padding(
    padding: const EdgeInsets.symmetric(
    vertical: 25,
    horizontal: 15,
    ),
    child: Row(
    children: [
    Expanded(
    child: TextFormField(
    controller: _textController,
    autofocus: true,
    decoration: InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
    hintText: '  Enter your questions ',
    border: OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1.5),

    borderRadius: BorderRadius.circular(30),
    ),
    focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
    color: defualtcolelr,
    width: 2.0,
    ),
    borderRadius: BorderRadius.circular(30.0),
    ),
    errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
    color: Colors.red,
    width: 2.0,
    ),
    borderRadius: BorderRadius.circular(30.0),
    ),
    filled: true,
    fillColor: Colors.grey[300],


    ),
    ),
    ),
    const SizedBox.square(
    dimension: 15,
    ),
    if (!_loading)
    IconButton(
    onPressed: () async {
    _sendChatMessage(_textController.text);
    },
    icon: Icon(
    Icons.send,
    color: Colors.white,
    size: 40,
    ),color: defualtcolelr,
    )
    else
    const CircularProgressIndicator(color:Colors.blue ,),
    ],
    ),
    ),
    ],
    ),
    )
      ],
    );
  }
  Future<void> _sendChatMessage(String message) async {
    setState(() => _loading = true);

    try {
      final response = await _chat.sendMessage(Content.text(message));
      final text = response.text;
      if (text == null) {
        debugPrint('No response from API.');
        return;
      }
      setState(() => _loading = false);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      _textController.clear();
      setState(() => _loading = false);
    }
  }
}



class MessageWidget extends StatelessWidget {
  final String text;
  final bool isFromUser;

  const MessageWidget({
    super.key,
    required this.text,
    required this.isFromUser,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            decoration: BoxDecoration(
              color: isFromUser
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(18),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            margin: const EdgeInsets.only(bottom: 8),
            child: MarkdownBody(
              selectable: true,
              data: text,
            ),
          ),
        ),
      ],
    );
  }
}