import 'package:flutter/material.dart';
import 'package:fluttercareerui/constants/app_language.dart';

class ChatBotTextField extends StatelessWidget {
  const ChatBotTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.8,
          child: TextField(
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              hintText: AppLanguage.askAboutCareer,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(
                  color: Color(0xFFDEE3F2),
                  width: 1,
                ),
              ),
            ),
          ),
        ),
        // send button
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.lightBlueAccent.shade200,
          shape: const CircleBorder(),
          child: const Icon(Icons.send),
        )
      ],
    );
  }
}
