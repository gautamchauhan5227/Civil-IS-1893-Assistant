import 'package:flutter/material.dart';
import 'package:is_1893_assistant/screen/home/chapters/chap7/constant_string.dart';

class ChapterSevenScreen extends StatelessWidget {
  Widget row = Row(
    children: [
      Container(
        height: 8,
        width: 8,
        color: Color(0xffFFD600),
      ),
      SizedBox(width: 8),
      Container(
        height: 8,
        width: 8,
        color: Color(0xffFFD600),
      ),
      SizedBox(width: 8),
      Container(
        height: 8,
        width: 8,
        color: Color(0xffFFD600),
      ),
      SizedBox(width: 8),
      Container(
        height: 8,
        width: 8,
        color: Color(0xffFFD600),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "image/bakground.png",
            height: double.maxFinite,
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: ListView.builder(
              itemCount: sevenChapterList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    bottom: 15,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // if (index == 0) {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => ChapterSixOneScreen(),
                      //     ),
                      //   );
                      // } else if (index == 1) {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => ChapterSixTwoScreen(),
                      //     ),
                      //   );
                      // } else if (index == 2) {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => ChapterSixThreeScreen(),
                      //     ),
                      //   );
                      // } else {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => ChapterSixFourScreen(),
                      //     ),
                      //   );
                      // }
                    },
                    child: Container(
                      height: 125,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white54,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: sevenChapterList[index].contains("*")
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            sevenChapterList[index].substring(
                                                0,
                                                sevenChapterList[index]
                                                    .indexOf('*')),
                                            softWrap: true,
                                            overflow: TextOverflow.visible,
                                            textScaleFactor: 1.0,
                                            // maxLines: 3,
                                            style: TextStyle(
                                                fontSize: 40,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            sevenChapterList[index].split('*')[1],
                                            softWrap: true,
                                            overflow: TextOverflow.visible,
                                            textScaleFactor: 1.0,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),
                                          ),
                                        ],
                                      )
                                    : Text(
                                        sevenChapterList[index],
                                        softWrap: true,
                                        overflow: TextOverflow.visible,
                                        textScaleFactor: 1.0,
                                        style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            ),
                            Flexible(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  row,
                                  Text(
                                    "7.${index + 1}",
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                  row
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 30,
            left: 15,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: Color(0xffFFD600),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
