import 'package:bloc/bloc.dart';
import 'package:fluttercareerui/services/service.dart';

import 'blog_event.dart';
import 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  BlogBloc(APIDataProvider provider)
      : super(const BlogStateUninitialised(isLoading: true)) {
    on<BlogEventInitialise>((event, emit) async {
      try {
        emit(const BlogStateUninitialised(isLoading: true));
        final career = await provider.getCareerlist();
        final blog = await provider.getHomeBlog();
        emit(BlogStateInitial(
          isLoading: false,
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
        emit(const BlogStateUninitialised(isLoading: true));
        final bloglist = await provider.getBloglist(event.url);
        emit(BlogStateBlogList(blogList: bloglist, isLoading: false));
      } on APICallException {
        emit(state); // error message
      }
    });

    on<BlogEventBlogContant>((event, emit) async {
      try {
        var currentstate = state;
        emit(const BlogStateUninitialised(isLoading: true));
        final contant = await provider.getBlogcontant(event.url);
        emit(BlogStateContantBlog(
            isLoading: false, blogcontant: contant, state: currentstate));
      } on APICallException {
        emit(state); // error message
      }
    });

    on<BlogEventPreviousState>((event, emit) {
      emit(event.state);
    });
  }
}
