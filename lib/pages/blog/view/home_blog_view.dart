import 'package:flutter/material.dart';
import 'package:fluttercareerui/constants/constants.dart';
import 'package:fluttercareerui/helpers/shaders/gradient_shader.dart';
import 'package:fluttercareerui/models/blog_model.dart';
import 'package:fluttercareerui/pages/blog/widget/widgets.dart';
import 'package:fluttercareerui/pages/chat/view/view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.bloglist, this.careerList});

  final Iterable<BlogList>? bloglist;
  final Iterable<MenuItem>? careerList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChatBot(careerList: careerList),
                ));
              },
              icon: const Icon(
                Icons.chat_rounded,
                color: Colors.white,
                size: 35,
              )),
          const SizedBox(width: 10),
        ],
      ),
      body: CustomPaint(
        painter: GradientPainter(),
        child: ListView(
          children: <Widget>[
            Text(
              AppLanguage.home,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w900,
                color: Colors.blueGrey.shade700,
              ),
            ),
            const RoadmapBoxWidget()
          ]
              .followedBy(
                bloglist?.map(
                      (pageItem) => Container(
                        margin: const EdgeInsets.all(8.0),
                        height: 370,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              '${pageItem.title}',
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 320,
                              child: PageView(
                                children: pageItem.itemList
                                    .map((blogItem) =>
                                        PageBlocBox(item: blogItem))
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ) ??
                    [],
              )
              .toList(),
        ),
      ),
    );
  }
}
