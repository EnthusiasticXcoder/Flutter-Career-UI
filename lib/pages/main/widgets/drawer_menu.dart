import 'package:flutter/material.dart';
import 'package:fluttercareerui/bloc/bloc.dart';
import 'package:fluttercareerui/models/models.dart';
import 'package:fluttercareerui/pages/main/widgets/widgets.dart';

class DrawerMenu extends StatelessWidget {
  final Iterable<MenuItem>? careerlist;
  final APIUser? user;
  final VoidCallback onPress;
  const DrawerMenu(
      {super.key,
      required this.careerlist,
      required this.onPress,
      required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black87, borderRadius: BorderRadius.circular(22)),
      margin: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // margin
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.075),

            // user tile
            ListTile(
              contentPadding: const EdgeInsets.only(left: 16.0, right: 8.0),
              minLeadingWidth: 0,
              textColor: Colors.blueGrey.shade200,
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Text('${user?.firstName} ${user?.lastName}'),
              subtitle: Text(
                '${user?.email}',
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                onPressed: () {
                  context.read<MainBloc>().add(
                        const MainEventLogout(isLoggedIn: true),
                      );
                },
                icon: const Icon(Icons.logout),
                style: IconButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.blueGrey,
                    foregroundColor: Colors.blueGrey.shade200),
              ),
            ),
            const Divider(
              indent: 12.0,
              endIndent: 12.0,
            ),
          ]
              .followedBy(
                // menu list
                careerlist?.map(
                      (menu) {
                        if (menu.attributes != null) {
                          return ExpansionTile(
                            shape: const ContinuousRectangleBorder(),
                            textColor: Colors.white,
                            iconColor: Colors.blueGrey.shade300,
                            collapsedTextColor: Colors.white,
                            collapsedIconColor: Colors.blueGrey.shade300,
                            title: Text(menu.text),
                            children: menu.attributes!
                                .map(
                                  (item) => NestedList(
                                    careeritem: item,
                                    onPress: onPress,
                                  ),
                                )
                                .toList(),
                          );
                        } else {
                          return ListTile(
                            textColor: Colors.white,
                            iconColor: Colors.blueGrey.shade300,
                            title: Text(menu.text),
                            onTap: () {
                              context.read<BlogBloc>().add(
                                    BlogEventBlogContant(menu.blog),
                                  );
                              onPress();
                            },
                          );
                        }
                      },
                    ) ??
                    [],
              )
              .toList(),
        ),
      ),
    );
  }
}
