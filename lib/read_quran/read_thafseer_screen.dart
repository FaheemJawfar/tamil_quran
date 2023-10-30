import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/common_widgets/show_toast.dart';
import 'package:tamil_quran/providers/quran_provider.dart';
import 'package:tamil_quran/read_quran/verse_helper.dart';

class ReadThafseerScreen extends StatefulWidget {
  final String header;
  final String content;
  final int thafseerNumber;

  const ReadThafseerScreen({
    required this.header,
    required this.content,
    required this.thafseerNumber,
    Key? key,
  }) : super(key: key);

  @override
  State<ReadThafseerScreen> createState() => _ReadThafseerScreenState();
}

class _ReadThafseerScreenState extends State<ReadThafseerScreen> {
  final ScrollController _controller = ScrollController();
  double _textWidth = 0.0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_controller.position.maxScrollExtent > 0) {
        setState(() {
          _textWidth = _controller.position.maxScrollExtent;
        });
        _startScrolling();
      }
    });
  }

  void _startScrolling() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        _controller.animateTo(
          _textWidth,
          duration: const Duration(seconds: 5), // Adjust the scroll duration
          curve: Curves.linear,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: _controller,
          child: Text(
            widget.header,
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
        centerTitle: true,

        actions: [
          IconButton(
            visualDensity: VisualDensity.compact,
              onPressed: () {
              String textToShare = '${widget.header}\n${'-' * widget.header.length}\n\n${widget.content}\n\n${'*' * widget.header.length}\nP. ஜைனுலாப்தீன் அவர்கள் மொழிபெயர்த்த திருக்குர்ஆன் தமிழாக்கத்தின் ${widget.thafseerNumber}வது விளக்கக் குறிப்பு.';
              VerseHelper.copyText(textToShare);
              ShowToast.showToast(context, 'விளக்கக் குறிப்பு பிரதி செய்யப்பட்டது!');

          }, icon: const Icon(Icons.copy_all)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            widget.content,
            style: TextStyle(fontSize: Provider.of<QuranProvider>(context, listen: false).tamilFontSize),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
