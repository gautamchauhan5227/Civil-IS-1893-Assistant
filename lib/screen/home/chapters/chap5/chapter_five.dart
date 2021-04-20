import 'package:flutter/material.dart';
import 'package:is_1893_assistant/screen/home/chapters/chap5/constant_string.dart';
import 'package:speech_recognition/speech_recognition.dart';

class ChapterFiveScreen extends StatefulWidget {
  @override
  _ChapterFiveScreenState createState() => _ChapterFiveScreenState();
}

class _ChapterFiveScreenState extends State<ChapterFiveScreen> {
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
      newDataList = chapterFiveList
          .where((string) => string.toLowerCase().contains(text.toLowerCase()))
          .toList();
    });
  }

  void onRecognitionComplete() => setState(() => _isListening = false);

  List<String> newDataList = List.from(chapterFiveList);

  onItemChanged(String value) {
    setState(() {
      newDataList = chapterFiveList
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
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
          preferredSize: Size.fromHeight(85),
        ),
      ),
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
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white54,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFD600),
                                  borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(5),
                                  ),
                                ),
                                height: 25,
                                child: Text(
                                  newDataList[index].substring(
                                      0, newDataList[index].indexOf('*')),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: Colors.white54,
                                  borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(5),
                                  ),
                                ),
                                height: 25,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        symbolList[index].substring(
                                            0, symbolList[index].indexOf('*')),
                                        overflow: TextOverflow.visible,
                                        textScaleFactor: 1,
                                        softWrap: true,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Padding(
                                        padding: index == 43
                                            ? EdgeInsets.only(bottom: 10)
                                            : EdgeInsets.only(top: 10),
                                        child: Text(
                                          symbolList[index].split("*")[1],
                                          overflow: TextOverflow.visible,
                                          textScaleFactor: 1,
                                          softWrap: true,
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          newDataList[index].split('*')[2],
                          overflow: TextOverflow.visible,
                          textScaleFactor: 1,
                          textAlign: TextAlign.start,
                          textWidthBasis: TextWidthBasis.longestLine,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            wordSpacing: 5,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
