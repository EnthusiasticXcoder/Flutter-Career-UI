import 'package:flutter/material.dart';
import 'package:fluttercareerui/bloc/bloc.dart';
import 'package:fluttercareerui/constants/constants.dart';
import 'package:fluttercareerui/helpers/shaders/gradient_shader.dart';
import 'package:fluttercareerui/models/blog_model.dart';
import 'package:fluttercareerui/pages/blog/widget/widgets.dart';

class BlogContantView extends StatelessWidget {
  const BlogContantView({
    super.key,
    required this.contant,
    required this.state,
  });

  final Iterable<ContantItem> contant;
  final BlogState state;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        context.read<BlogBloc>().add(
              BlogEventPreviousState(state),
            );
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(0, 50),
          child: Container(),
        ),
        body: CustomPaint(
          painter: GradientPainter(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: contant.map((item) {
                  switch (item.tag) {
                    case 'img':
                      return Container(
                        height: 200,
                        margin: const EdgeInsets.only(bottom: 22.0),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: NetworkImage(
                                item.contant,
                              ),
                              fit: BoxFit.fill),
                        ),
                      );
                    case 'table':
                      return TabularView(item: item);
                    case 'list':
                      return BulletList(list: item.contant);
                    case 'a':
                      return TextButton(
                        style: TextButton.styleFrom(shape: const StarBorder()),
                        onPressed: () {
                          final String? link = item.link;

                          if (link != null && !link.startsWith('#')) {
                            if (link.contains('category')) {
                              context.read<BlogBloc>().add(
                                    BlogEventCatagoryBlogList(link),
                                  );
                            } else if (link.contains('blog')) {
                              context.read<BlogBloc>().add(
                                    BlogEventBlogContant(link),
                                  );
                            }
                          }
                        },
                        child: Text(
                          '${item.contant}\n',
                          textAlign: TextAlign.justify,
                          style: tagStyles[item.tag]?.copyWith(
                              fontWeight: (item.link != null)
                                  ? FontWeight.w900
                                  : FontWeight.normal),
                        ),
                      );
                    default:
                      return Text(
                        '${item.contant}\n',
                        textAlign: TextAlign.justify,
                        style: tagStyles[item.tag],
                      );
                  }
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
