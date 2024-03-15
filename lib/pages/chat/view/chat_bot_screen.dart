import 'package:flutter/material.dart';
import 'package:fluttercareerui/constants/app_constant.dart';
import 'package:fluttercareerui/helpers/shaders/gradient_shader.dart';
import 'package:fluttercareerui/models/models.dart';
import 'package:fluttercareerui/pages/chat/widgets/widgets.dart';

class ChatBot extends StatelessWidget {
  const ChatBot({super.key, this.careerList});

  final Iterable<MenuItem>? careerList;

  @override
  Widget build(BuildContext context) {
    var careerFieldList = careerList
        ?.firstWhere((element) => element.text == AppConstants.career,
            orElse: () => const MenuItem(text: AppConstants.career))
        .attributes;
    List<List<String>> careerNames = [];
    if (careerFieldList != null) {
      int i = 0;
      while (i < careerFieldList.length - 1) {
        careerNames.add([
          careerFieldList.elementAt(i).text,
          careerFieldList.elementAt(i + 1).text
        ]);
        i = i + 2;
      }
    }

    return Scaffold(
      appBar: const ChatAppBar(),
      body: CustomPaint(
        painter: GradientPainter(),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 70.0),
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      image: const DecorationImage(
                          image: NetworkImage(AppConstants.chatBotImageURL)),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
            ]
                .followedBy(careerNames.map<Widget>((careerPair) => PairButtons(
                      firstButtonText: careerPair.first,
                      secondButtonText: careerPair.last,
                    )))
                .toList(),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: const ChatBotTextField(),
    );
  }
}
