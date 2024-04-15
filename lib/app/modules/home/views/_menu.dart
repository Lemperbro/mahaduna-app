import 'package:flutter/material.dart';
import 'package:mahaduna_apps/app/config/config.dart';
import 'package:mahaduna_apps/app/routes/navigate_routes.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  NavigateRoutes.navRoutes['test']!(context);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                          color:
                              Color(ConfigColor.appBarColor2).withOpacity(0.2),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: SizedBox(
                        child: Image.asset(
                          'assets/icons/jadwal.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Jadwal',
                        style: TextStyle(fontWeight: FontWeight.w600))
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Color(ConfigColor.appBarColor2).withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: SizedBox(
                      width: 10,
                      child: Image.asset(
                        'assets/icons/majalah.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Addiya', style: TextStyle(fontWeight: FontWeight.w600))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Color(ConfigColor.appBarColor2).withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: SizedBox(
                      // width: 10,
                      child: Image.asset('assets/icons/store.png',
                          fit: BoxFit.contain),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Store', style: TextStyle(fontWeight: FontWeight.w600))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Color(ConfigColor.appBarColor2).withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: SizedBox(
                      width: 10,
                      child: Image.asset(
                        'assets/icons/artikel.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Artikel',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          leadingDistribution:
                              TextLeadingDistribution.proportional))
                ],
              ),
            ],
          ),
          width: double.infinity,
          height: 100,
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            ],
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
