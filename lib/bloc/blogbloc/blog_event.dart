import 'package:flutter/material.dart' show immutable;
import 'package:fluttercareerui/bloc/blogbloc/blog_state.dart';

@immutable
abstract class BlogEvent {
  const BlogEvent();
}

class BlogEventInitialise extends BlogEvent {
  const BlogEventInitialise();
}

class BlogEventCatagoryBlogList extends BlogEvent {
  final String? url;
  const BlogEventCatagoryBlogList(this.url);
}

class BlogEventBlogContant extends BlogEvent {
  final String? url;
  const BlogEventBlogContant(this.url);
}

class BlogEventPreviousState extends BlogEvent {
  final BlogState state;
  const BlogEventPreviousState(this.state);
}
