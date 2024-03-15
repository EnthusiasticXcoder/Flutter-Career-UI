import 'package:flutter/material.dart';

class PairButtons extends StatelessWidget {
  const PairButtons(
      {super.key,
      required this.firstButtonText,
      required this.secondButtonText});

  final String firstButtonText;
  final String secondButtonText;

  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.sizeOf(context).width * 0.4;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  fixedSize: Size(buttonWidth, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0))),
              onPressed: () {},
              child: Text(firstButtonText)),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  fixedSize: Size(buttonWidth, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0))),
              onPressed: () {},
              child: Text(secondButtonText)),
        ],
      ),
    );
  }
}
