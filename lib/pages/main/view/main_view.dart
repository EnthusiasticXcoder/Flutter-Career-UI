import 'package:flutter/material.dart';
import 'package:fluttercareerui/bloc/bloc.dart';
import 'package:fluttercareerui/pages/blog/view/view.dart';
import 'package:fluttercareerui/pages/main/widgets/widgets.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
  bool isSideBarOpen = false;

  late AnimationController _animationController;
  late Animation<double> animation;

  @override
  void initState() {
    context.read<BlogBloc>().add(
          const BlogEventInitialise(),
        );
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400))
      ..addListener(
        () {
          setState(() {});
        },
      );
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double sidebarwidth = MediaQuery.sizeOf(context).width * 0.75;
    return WillPopScope(
      onWillPop: () {
        if (isSideBarOpen) {
          _animationController.reverse();
          isSideBarOpen = !isSideBarOpen;
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            // Tabbar widget animation
            BlocBuilder<BlogBloc, BlogState>(
              builder: (context, state) {
                if (state is BlogStateBlogList) {
                  return CatagoryList(blogList: state.blogList);
                } else if (state is BlogStateContantBlog) {
                  return BlogContantView(
                    contant: state.blogcontant,
                    state: state.state,
                  );
                } else if (state is BlogStateInitial) {
                  return HomeView(bloglist: state.bloglist);
                } else {
                  return const Scaffold();
                }
              },
            ),

            // Drawer Widget animation
            AnimatedPositioned(
              width: sidebarwidth,
              height: MediaQuery.of(context).size.height,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              left: isSideBarOpen ? 0 : -sidebarwidth,
              top: 0,
              child: BlocBuilder<BlogBloc, BlogState>(
                buildWhen: (previous, current) => current is BlogStateInitial,
                builder: (context, state) {
                  state = state as BlogStateInitial;

                  return DrawerMenu(
                    careerlist: state.carrierlist,
                    user: state.user,
                    onPress: () {
                      if (_animationController.value == 0) {
                        _animationController.forward();
                      } else {
                        _animationController.reverse();
                      }

                      isSideBarOpen = !isSideBarOpen;
                    },
                  );
                },
              ),
            ),

            // menu button animation
            AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              curve: Curves.fastOutSlowIn,
              left: isSideBarOpen ? sidebarwidth * 0.04 : 5,
              top: isSideBarOpen ? sidebarwidth * 0.02 : 15,
              child: MenuButton(
                onPress: () {
                  if (_animationController.value == 0) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }

                  isSideBarOpen = !isSideBarOpen;
                },
                animation: animation,
              ),
            )
          ],
        ),
      ),
    );
  }
}
