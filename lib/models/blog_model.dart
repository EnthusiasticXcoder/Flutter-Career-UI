import 'package:flutter/material.dart' show immutable;
import 'package:fluttercareerui/constants/constants.dart';

@immutable
class ContantItem {
  final String tag;
  final dynamic contant;
  final String? link;
  const ContantItem(this.tag, this.contant, this.link);

  ContantItem.fromMap(dynamic map)
      : tag = map[tagField],
        contant = map[contantField],
        link = map[linkField];
}

@immutable
class BlogItem {
  final String? image;
  final String? catagory;
  final String? catagoryLink;
  final String? title;
  final String? link;
  final String? text;

  const BlogItem(this.image, this.catagory, this.title, this.link, this.text,
      this.catagoryLink);

  BlogItem.fromMap(dynamic map)
      : image = map['img'] as String,
        catagory = map['catagory'] as String,
        catagoryLink = map['catagorylink'] as String?,
        title = map['title'] as String,
        link = map[linkField] as String,
        text = map['text'] as String;
}

@immutable
class BlogList {
  final String? title;
  final Iterable<BlogItem> itemList;

  const BlogList(this.title, this.itemList);

  BlogList.fromMap(dynamic map)
      : itemList = (map[contantField] != null)
            ? map[contantField].map<BlogItem>((item) => BlogItem.fromMap(item))
            : [],
        title = map['title'] as String;
}

@immutable
class MenuItem {
  final String text;
  final String? blog;
  final Iterable<MenuItem>? attributes;

  const MenuItem({required this.text, this.blog, this.attributes});

  MenuItem.fromMap(dynamic map)
      : text = map['text'],
        attributes = (map['attlist'] != null)
            ? map['attlist'].map<MenuItem>((item) => MenuItem.fromMap(item))
            : null,
        blog = map['blog'];
}
