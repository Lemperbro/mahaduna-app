import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';

class AddiyaPopuler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(),
        CarouselSlider(
          options: CarouselOptions(
              enlargeCenterPage: true,
              viewportFraction: 0.6,
              height: 250.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 2)),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return InkWell(
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/addiya1.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        )
      ],
    );
  }

  Widget Header() {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        margin: EdgeInsets.only(bottom: 10),
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
                  'Addiya Populer',
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

class AddiyaTerbaru extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(),
        SizedBox(
          height: 10,
        ),
        Addiya()
      ],
    );
  }

  Widget Header() {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        margin: EdgeInsets.only(bottom: 10),
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
                  'Addiya Terbaru',
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

  Widget Addiya() {
    return ResponsiveGridList(
        desiredItemWidth: 150,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        minSpacing: 10,
        children: [1, 2, 3, 4, 5, 6].map((i) {
          return InkWell(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(children: [
                Image.network(
                  'https://picsum.photos/id/${i}/200/300',
                  fit: BoxFit.cover,
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 18),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0),
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(1),
                            Colors.black,
                          ],
                        ),
                      ),
                      height: 100,
                      child: Center(
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.start,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )),
              ]),
            ),
          );
        }).toList());
    // return GridView.count(
    //   shrinkWrap: true,
    //   physics: NeverScrollableScrollPhysics(),
    //   crossAxisCount: 2,
    //   mainAxisSpacing: 10,
    //   crossAxisSpacing: 10,
    //   childAspectRatio: aspectRatio,
    //   children: [1, 2, 3, 4, 5, 6].map((i) {
    //     return InkWell(
    //       child: Container(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Container(
    //               width: imageWidth,
    //               height: imageHeight,
    //               decoration: BoxDecoration(boxShadow: [
    //                 BoxShadow(
    //                   color: Colors.grey.withOpacity(0.5),
    //                   spreadRadius: 1,
    //                   blurRadius: 10,
    //                   offset: const Offset(-4, 4),
    //                 )
    //               ]),
    //               child: ClipRRect(
    //                 borderRadius: BorderRadius.circular(10),
    //                 child: Image.network(
    //                   'https://picsum.photos/id/${i}/200/300',
    //                   fit: BoxFit.cover,
    //                 ),
    //               ),
    //             ),
    //             Container(
    //               padding: EdgeInsets.symmetric(vertical: 8),
    //               child: Column(
    //                 children: [
    //                   Text(
    //                     'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. $i',
    //                     style: TextStyle(
    //                         fontWeight: FontWeight.w600, fontSize: 15),
    //                     maxLines: 2,
    //                     overflow: TextOverflow.ellipsis,
    //                   )
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     );
    //   }).toList(),
    // );
  }
}
