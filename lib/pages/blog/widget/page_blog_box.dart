import 'package:flutter/material.dart';
import 'package:fluttercareerui/bloc/bloc.dart';
import 'package:fluttercareerui/models/blog_model.dart';

class PageBlocBox extends StatelessWidget {
  const PageBlocBox({
    super.key,
    required this.item,
  });

  final BlogItem item;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              spreadRadius: -1.0,
              blurRadius: 2.0,
              offset: Offset(5.0, 5.0),
            ),
            BoxShadow(
              color: Colors.black12,
              spreadRadius: -1.0,
              blurRadius: 6.0,
              offset: Offset(-1.0, -1.0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ListTile(
              title: Text(
                '${item.catagory}',
                style: const TextStyle(fontSize: 18),
              ),
              trailing: TextButton(
                  onPressed: () {
                    context.read<BlogBloc>().add(
                          BlogEventCatagoryBlogList(item.catagoryLink),
                        );
                  },
                  child: const Text('View All')),
            ),
            InkWell(
              onTap: () {
                context.read<BlogBloc>().add(
                      BlogEventBlogContant(item.link),
                    );
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                height: 250,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(item.image!),
                    fit: BoxFit.fill,
                    onError: (exception, stackTrace) => Container(),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(12)),
                  child: RichText(
                    text: TextSpan(
                      text: '${item.title}.\n',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: '\n${item.text}...',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '  Read More',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
