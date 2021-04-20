import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:is_1893_assistant/screen/home/chapters/chap1/chapter_one.dart';
import 'package:is_1893_assistant/screen/home/chapters/chap3/chapter_three.dart';
import 'package:is_1893_assistant/screen/home/chapters/chap4/chapter_four.dart';
import 'package:is_1893_assistant/screen/home/chapters/chap5/chapter_five.dart';
import 'package:is_1893_assistant/screen/home/chapters/chap6/chapter_six.dart';
import 'package:is_1893_assistant/screen/home/chapters/chap7/chapter_seven.dart';

import 'chapters/chap2/chapter_two.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<SliderMenuContainerState> _key =
      new GlobalKey<SliderMenuContainerState>();

       int $beta = 0x03B2;
  List<String> chapterName = [
    "Scope",
    "References",
    "Terminogy*for earthquake engineering",
    "Terminogy*for earthquake engineering of buildings",
    "Symbols",
    "General*Principles and design criteria",
    "Buildings",
  ];

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      
      body: SliderMenuContainer(
        appBarColor: Colors.black,
        key: _key,
        sliderMenuOpenSize: 200,
        animationDuration: 10,
        drawerIconColor: Color(0xffFFD600),
        drawerIconSize: 35,
        isDraggable: true,
        title: Text(
          "Home",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        sliderMenu: MenuWidget(
          onItemClick: (title) {
            _key.currentState.closeDrawer();
          },
        ),
        sliderMain: Stack(
          children: [
            Image.asset(
              "image/bakground.png",
              height: double.maxFinite,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChapterOneScreen(),
                  ),
                );
              },
              child: ListView.builder(
                itemCount: chapterName.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChapterOneScreen(),
                            ),
                          );
                        } else if(index==1){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChapterTwoScreen(),
                            ),
                          );
                        }else if(index==2){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChapterThreeScreen(),
                            ),
                          );
                        }else if(index==3){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChapterFourScreen(),
                            ),
                          );
                        }else if(index==4){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChapterFiveScreen(),
                            ),
                          );
                        }else if(index==5){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChapterSixScreen(),
                            ),
                          );
                        }else if(index==6){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChapterSevenScreen(),
                            ),
                          );
                        }
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
                                  child: chapterName[index].contains("*")
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              chapterName[index].substring(
                                                  0,
                                                  chapterName[index]
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
                                              chapterName[index].split('*')[1],
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
                                          chapterName[index],
                                          softWrap: true,
                                          overflow: TextOverflow.visible,
                                          textScaleFactor: 1.0,
                                          style: TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
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
                                      "${index + 1}",
                                      style: TextStyle(
                                          fontSize: 45, color: Colors.white),
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
          ],
        ),
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  final Function(String) onItemClick;

  const MenuWidget({Key key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: 200,
      // color: Colors.black,
      decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              image: AssetImage(
            "image/bakground.png",
          ))),
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
              radius: 55,
              // child: Container(color:Colors.red),
              // backgroundImage: AssetImage('assets/images/user_profile.jpg'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Nick',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'BalsamiqSans'),
          ),
          SizedBox(
            height: 20,
          ),
          sliderItem('Home', Icons.home),
          sliderItem('LogOut', Icons.arrow_back_ios)
        ],
      ),
    );
  }

  Widget sliderItem(String title, IconData icons) => ListTile(
      title: Text(
        title,
        style:
            TextStyle(color: Colors.white, fontFamily: 'BalsamiqSans_Regular'),
      ),
      leading: Icon(
        icons,
        color: Color(0xffFFD600),
      ),
      onTap: () {
        onItemClick(title);
      });
}
