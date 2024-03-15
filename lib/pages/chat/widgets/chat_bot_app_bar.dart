import 'package:flutter/material.dart';
import 'package:fluttercareerui/constants/constants.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(12.0),
            gradient: LinearGradient(colors: [
              Colors.lightBlue.shade50,
              Colors.lightBlue.shade50,
              Colors.lightBlue.shade100,
              Colors.lightBlue.shade100,
              Colors.lightBlue.shade200,
              Colors.lightBlue.shade300,
              Colors.lightBlue.shade300,
              Colors.lightBlue.shade400,
              Colors.lightBlue.shade600
            ])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () => Navigator.pop(context),
                child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: BackButtonIcon())),
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: NetworkImage(AppConstants.chatBotImageURL)),
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.lightBlueAccent,
              ),
            ),
            const SizedBox(width: 8.0),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLanguage.careerBot,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Text(
                  AppLanguage.botDescription,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.clear_all_rounded, size: 35))
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 90);
}
