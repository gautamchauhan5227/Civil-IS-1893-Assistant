import 'package:flutter/material.dart';
import 'package:is_1893_assistant/screen/core/detail_card.dart';
import 'package:is_1893_assistant/screen/home/chapters/chap1/constant_string.dart';
import 'package:speech_recognition/speech_recognition.dart';

class ChapterOneScreen extends StatefulWidget {
  @override
  _ChapterOneScreenState createState() => _ChapterOneScreenState();
}

class _ChapterOneScreenState extends State<ChapterOneScreen> {
  TextEditingController _textController = TextEditingController();
  SpeechRecognition _speech;

  bool _speechRecognitionAvailable = false;
  bool _isListening = false;

  @override
  void initState() {
    activateSpeechRecognizer();
    // TODO: implement initState
    super.initState();
  }

  void activateSpeechRecognizer() {
    print('_MyAppState.activateSpeechRecognizer... ');
    _speech = new SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    // _speech.setCurrentLocaleHandler();
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    // _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    _speech
        .activate()
        .then((res) => setState(() => _speechRecognitionAvailable = res));
  }

  void start() => _speech
      .listen(locale: "en_US")
      .then((result) => print('_MyAppState.start => result ${result}'));

  void cancel() =>
      _speech.cancel().then((result) => setState(() => _isListening = result));

  void stop() =>
      _speech.stop().then((result) => setState(() => _isListening = result));

  void onSpeechAvailability(bool result) =>
      setState(() => _speechRecognitionAvailable = result);

  void onRecognitionStarted() => setState(() => _isListening = true);

  void onRecognitionResult(String text) {
    setState(() {
      _textController.text = text;
    });
    setState(() {
      newDataList = chapterOneList
          .where((string) => string.toLowerCase().contains(text.toLowerCase()))
          .toList();
    });
  }

  void onRecognitionComplete() => setState(() => _isListening = false);

  List<String> newDataList = List.from(chapterOneList);

  onItemChanged(String value) {
    setState(() {
      newDataList = chapterOneList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xffFFD600),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Scope"),
          backgroundColor: Colors.black,
          bottom: PreferredSize(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white54,
                  ),
                  alignment: Alignment.center,
                  child: TextField(
                    controller: _textController,
                    onChanged: onItemChanged,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: "Search...",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.mic,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          start();
                        },
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              preferredSize: Size.fromHeight(85))),
      body: Stack(
        children: [
          Image.asset(
            "image/bakground.png",
            height: double.maxFinite,
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
          ListView.builder(
            itemCount: newDataList.length,
            itemBuilder: (context, index) {
              return DetailsCard(
                data: newDataList[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
