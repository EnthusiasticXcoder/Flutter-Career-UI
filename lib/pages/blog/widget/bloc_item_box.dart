import 'package:flutter/material.dart';
import 'package:fluttercareerui/constants/constants.dart';
import 'package:fluttercareerui/models/models.dart';

class BlocListBox extends StatelessWidget {
  const BlocListBox({
    super.key,
    required this.item,
  });

  final BlogItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
      padding: const EdgeInsets.all(8.0),
      height: 220,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(item.image!),
          fit: BoxFit.fill,
          onError: (exception, stackTrace) => Container(),
        ),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            spreadRadius: -1.0,
            blurRadius: 10.0,
            offset: Offset(5.0, 5.0),
          ),
          BoxShadow(
            color: Colors.black12,
            spreadRadius: -1.0,
            blurRadius: 10.0,
            offset: Offset(-5.0, -5.0),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(12),
        ),
        child: RichText(
          text: TextSpan(
            text: item.catagory,
            style: TextStyle(
                color: Colors.blueGrey.shade100,
                fontSize: 18,
                fontWeight: FontWeight.w500),
            children: [
              TextSpan(
                text: '\n\n${item.title}.',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: '\n${item.text}...',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
              TextSpan(
                text: AppLanguage.readMore,
                style: TextStyle(
                  color: Colors.lightBlue.shade300,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
