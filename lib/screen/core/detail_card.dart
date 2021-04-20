import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  final String data;

  const DetailsCard({Key key, @required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                        data.substring(0, data.indexOf('*')),
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
                        padding: const EdgeInsets.only(left:12.0),
                        child: Text(
                          data.split("*")[1],
                          overflow: TextOverflow.visible,
                          textScaleFactor: 1,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                data.split('*')[2],
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
  }
}
