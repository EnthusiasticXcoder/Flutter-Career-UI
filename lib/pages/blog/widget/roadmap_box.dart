import 'package:flutter/material.dart';
import 'package:fluttercareerui/constants/app_language.dart';
import 'package:fluttercareerui/pages/blog/widget/web_view_display.dart';

class RoadmapBoxWidget extends StatelessWidget {
  const RoadmapBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: 370,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            spreadRadius: -1.0,
            blurRadius: 2.0,
            offset: Offset(5.0, 5.0),
          ),
          BoxShadow(
            color: Colors.black12,
            spreadRadius: -1.0,
            blurRadius: 6.0,
            offset: Offset(-1.0, -1.0),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: const WebViewDisplay()),
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const WebViewDisplay(),
                  ));
                },
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: -1.0,
                            blurRadius: 2.0,
                            offset: Offset(0.0, 0.0),
                          ),
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: -1.0,
                            blurRadius: 6.0,
                            offset: Offset(-1.0, -1.0),
                          ),
                        ],
                      ),
                      child: const Text(AppLanguage.softwareRoadmap,
                          style: TextStyle(fontSize: 22)),
                    ),
                    Container(margin: const EdgeInsets.all(4.0)),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
