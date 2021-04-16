import 'package:flutter/material.dart';

import '../models/content_model.dart';
import '../models/models.dart';

class Previews extends StatelessWidget {
  final String Title;
  final List<Content> contentList;

  const Previews({Key key, this.Title, this.contentList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              Title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              height: 165.0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                child: ListView.builder(
                    itemCount: contentList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      final Content content = contentList[index];
                      return GestureDetector(
                        onTap: () => print(content.name),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              height: 130.0,
                              width: 130.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(content.titleImageUrl),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: content.color, width: 4.0)),
                            ),
                            Container(
                              height: 130.0,
                              width: 130.0,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      colors: [
                                        Colors.black87,
                                        Colors.black45,
                                        Colors.transparent
                                      ],
                                      stops: [
                                        0,
                                        0.25,
                                        1
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: content.color, width: 4.0)),
                            ),
                            Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: SizedBox(
                                  height: 60.0,
                                  child: Image.asset(content.titleImageUrl),
                                ))
                          ],
                        ),
                      );
                    }),
              ))
        ],
      ),
    );
  }
}
