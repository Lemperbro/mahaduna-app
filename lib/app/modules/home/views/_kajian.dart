import 'package:flutter/material.dart';

class NewVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(),
        Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [1, 2, 3, 4].map((i) {
                return InkWell(
                  // onTap: () => print('ya'),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(children: [
                          Container(
                            width: 270,
                            height: 150,
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 3),
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Text(
                                '1.20.22',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ]),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 270,
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
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }

  Widget Header() {
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, right: 15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.withOpacity(0.4), // Warna garis
              width: 1.0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 3,
                  height: 18,
                  color: Colors.brown[400],
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Video Terbaru',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            Icon(
              Icons.chevron_right_rounded,
              size: 28,
            )
          ],
        ),
      ),
    );
  }
}

class Playlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderPlaylist(),
        Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [1, 2, 3, 4].map((i) {
                return InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 270,
                              height: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/thumbnail1.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 10,
                                right: 10,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.playlist_play_rounded,
                                          color: Colors.white,
                                          size: 17,
                                        ),
                                        Container(
                                          // margin: EdgeInsets.only(bottom: 4),
                                          child: Text('60',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 11),
                                              textAlign: TextAlign.center),
                                        )
                                      ]),
                                ))
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 270,
                          padding: EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  "Kajian Kitab Wa Huwa Bil Ufuqil A'la",
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
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }

  Widget HeaderPlaylist() {
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, right: 15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.withOpacity(0.4), // Warna garis
              width: 1.0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 3,
                  height: 18,
                  color: Colors.brown[400],
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Playlist Kajian',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            Icon(
              Icons.chevron_right_rounded,
              size: 28,
            )
          ],
        ),
      ),
    );
  }
}
