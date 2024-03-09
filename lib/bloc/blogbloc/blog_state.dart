import 'package:flutter/material.dart' show immutable;
import 'package:fluttercareerui/models/models.dart';

@immutable
abstract class BlogState {
  final bool isLoading;
  const BlogState({required this.isLoading});
}

class BlogStateUninitialised extends BlogState {
  const BlogStateUninitialised({required super.isLoading});
}

class BlogStateInitial extends BlogState {
  final Iterable<MenuItem>? carrierlist;
  final Iterable<BlogList>? bloglist;
  final APIUser? user;

  const BlogStateInitial(
      {required super.isLoading, this.user, this.carrierlist, this.bloglist});
}

class BlogStateBlogList extends BlogState {
  final BlogList blogList;
  const BlogStateBlogList({required super.isLoading, required this.blogList});
}

class BlogStateContantBlog extends BlogState {
  final Iterable<ContantItem> blogcontant;
  final BlogState state;
  const BlogStateContantBlog(
      {required super.isLoading,
      required this.blogcontant,
      required this.state});
}
