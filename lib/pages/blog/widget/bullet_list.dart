import 'package:flutter/material.dart';
import 'package:fluttercareerui/bloc/bloc.dart';
import 'package:fluttercareerui/constants/constants.dart';

class BulletList extends StatelessWidget {
  const BulletList({
    super.key,
    required this.list,
  });

  final List list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list
          .map(
            (line) => TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black87,
                alignment: Alignment.topLeft,
                shape: const StarBorder(),
              ),
              onPressed: () {
                final String? link = line[AppConstants.linkField];

                if (link != null && !link.startsWith('#')) {
                  if (link.contains(AppConstants.catagoryField)) {
                    context.read<BlogBloc>().add(
                          BlogEventCatagoryBlogList(link),
                        );
                  } else {
                    context.read<BlogBloc>().add(
                          BlogEventBlogContant(link),
                        );
                  }
                }
              },
              icon: const Icon(
                Icons.circle,
                size: 8,
              ),
              label: Text(
                line[AppConstants.text],
                style: tagStyles[Tags.p]?.copyWith(
                    fontWeight: (line[AppConstants.linkField] != null)
                        ? FontWeight.w900
                        : FontWeight.normal),
              ),
            ),
          )
          .toList(),
    );
  }
}
