import 'package:flutter/material.dart' show immutable;
import 'package:fluttercareerui/models/models.dart';


@immutable
abstract class BlogState {
  const BlogState();
}

class BlogStateInitial extends BlogState {
  final Iterable<MenuItem>? carrierlist;
  final Iterable<BlogList>? bloglist;
  final APIUser? user;

  const BlogStateInitial({this.user, this.carrierlist, this.bloglist});
}

class BlogStateBlogList extends BlogState {
  final BlogList blogList;
  const BlogStateBlogList(this.blogList);
}

class BlogStateContantBlog extends BlogState {
  final Iterable<ContantItem> blogcontant;
  final BlogState state;
  const BlogStateContantBlog(this.blogcontant, this.state);
}