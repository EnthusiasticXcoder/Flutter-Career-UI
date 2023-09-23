import 'package:bloc/bloc.dart';
import 'package:fluttercareerui/services/service.dart';

import 'blog_event.dart';
import 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  BlogBloc(APIDataProvider provider) : super(const BlogStateInitial()) {
    on<BlogEventInitialise>((event, emit) async {
      try {
        final career = await provider.getCareerlist();
        final blog = await provider.getHomeBlog();
        emit(BlogStateInitial(
          user: provider.currentuser,
          carrierlist: career,
          bloglist: blog,
        ));
      } on APICallException {
        emit(state); // error message
      }
    });

    on<BlogEventCatagoryBlogList>((event, emit) async {
      try {
        final bloglist = await provider.getBloglist(event.url);

        emit(BlogStateBlogList(bloglist));
      } on APICallException {
        emit(state); // error message
      }
    });

    on<BlogEventBlogContant>((event, emit) async {
      try {
        final contant = await provider.getBlogcontant(event.url);
        emit(BlogStateContantBlog(contant, state));
      } on APICallException {
        emit(state); // error message
      }
    });

    on<BlogEventPreviousState>((event, emit) {
      emit(event.state);
    });
  }
}
