import 'package:flutter/material.dart';
import 'package:fluttercareerui/bloc/bloc.dart';
import 'package:fluttercareerui/helpers/shaders/gradient_shader.dart';
import 'package:fluttercareerui/models/blog_model.dart';
import 'package:fluttercareerui/pages/blog/widget/widgets.dart';

class CatagoryList extends StatelessWidget {
  const CatagoryList({super.key, required this.blogList});

  final BlogList blogList;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<BlogBloc>().add(
              const BlogEventInitialise(),
            );
        return Future.value(false);
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(0, 20),
          child: Container(),
        ),
        body: CustomPaint(
          painter: GradientPainter(),
          child: Column(
            children: <Widget>[
              Text(
                blogList.title ?? '',
                style: const TextStyle(
                  height: 2,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: blogList.itemList.length,
                  itemBuilder: (context, index) {
                    final item = blogList.itemList.elementAt(index);
                    return InkWell(
                      onTap: () {
                        context.read<BlogBloc>().add(
                              BlogEventBlogContant(item.link),
                            );
                      },
                      child: BlocListBox(item: item),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
