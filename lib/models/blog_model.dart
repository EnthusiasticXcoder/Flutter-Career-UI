import 'package:flutter/material.dart' show immutable;
import 'package:fluttercareerui/constants/constants.dart';

@immutable
class ContantItem {
  final String tag;
  final dynamic contant;
  final String? link;
  const ContantItem(this.tag, this.contant, this.link);

  ContantItem.fromMap(dynamic map)
      : tag = map[AppConstants.tagField],
        contant = map[AppConstants.contentField],
        link = map[AppConstants.linkField];
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
      : image = map[AppConstants.imgField] as String,
        catagory = map[AppConstants.catagoryField] as String,
        catagoryLink = map[AppConstants.catagoryLinkField] as String?,
        title = map[AppConstants.title] as String,
        link = map[AppConstants.linkField] as String,
        text = map[AppConstants.text] as String;
}

@immutable
class BlogList {
  final String? title;
  final Iterable<BlogItem> itemList;

  const BlogList(this.title, this.itemList);

  BlogList.fromMap(dynamic map)
      : itemList = (map[AppConstants.contentField] != null)
            ? map[AppConstants.contentField]
                .map<BlogItem>((item) => BlogItem.fromMap(item))
            : [],
        title = map[AppConstants.title] as String;
}

@immutable
class MenuItem {
  final String text;
  final String? blog;
  final Iterable<MenuItem>? attributes;

  const MenuItem({required this.text, this.blog, this.attributes});

  MenuItem.fromMap(dynamic map)
      : text = map[AppConstants.text],
        attributes = (map[AppConstants.attributeListField] != null)
            ? map[AppConstants.attributeListField]
                .map<MenuItem>((item) => MenuItem.fromMap(item))
            : null,
        blog = map[AppConstants.blogField];
}
