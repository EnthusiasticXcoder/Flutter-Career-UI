import 'package:flutter/material.dart';
import 'package:fluttercareerui/bloc/bloc.dart';
import 'package:fluttercareerui/models/blog_model.dart';

class NestedList extends StatelessWidget {
  final MenuItem careeritem;
  final VoidCallback onPress;
  const NestedList(
      {super.key, required this.careeritem, required this.onPress});

  @override
  Widget build(BuildContext context) {
    if (careeritem.attributes != null) {
      return ExpansionTile(
        shape: const ContinuousRectangleBorder(),
        textColor: Colors.white,
        iconColor: Colors.blueGrey.shade300,
        collapsedTextColor: Colors.white,
        collapsedIconColor: Colors.blueGrey.shade300,
        title: Text(careeritem.text),
        children: careeritem.attributes!
            .map(
              (item) => NestedList(
                careeritem: item,
                onPress: onPress,
              ),
            )
            .toList(),
      );
    } else {
      return ListTile(
        onTap: () {
          context.read<BlogBloc>().add(
                BlogEventCatagoryBlogList(careeritem.blog),
              );
          onPress();
        },
        textColor: Colors.white,
        iconColor: Colors.blueGrey.shade300,
        title: Text(careeritem.text),
      );
    }
  }
}
