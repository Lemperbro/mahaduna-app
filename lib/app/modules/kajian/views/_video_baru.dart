import 'package:flutter/material.dart';

class VideoBaru extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((i) {
          return InkWell(
            // onTap: () => print('ya'),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.black.withOpacity(0.4), width: 0.5))),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 165,
                        height: 93,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/thumbnail1.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            '1.20.22',
                            style: TextStyle(fontSize: 10, color: Colors.white, ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "🔴 [LIVE] Kajian Kitab Wa Huwa Bil Ufuqil A'la Part : 1",
                              style: TextStyle(
                                  height: 1.5,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              softWrap: true,
                              maxLines: null,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text('eN-A Tv',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w600)),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 7),
                            child: Text('Selasa, 09 April 2024',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
