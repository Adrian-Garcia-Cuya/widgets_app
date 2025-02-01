import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app_4/config/menu/menu_items.dart';
import 'package:widgets_app_4/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {

  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: const _HomeView(),
      drawer: SideMenu( scaffoldKey: scaffoldKey ),
    );
  }
}

class _HomeView extends StatelessWidget {

  const _HomeView();

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (BuildContext context, int index) {
        final menuItem = appMenuItems[index];
        return _CustomListTile(menuItem: menuItem);
      }
    );
  }
}

class _CustomListTile extends StatelessWidget {

  final MenuItem menuItem;

  const _CustomListTile({
    required this.menuItem,
  });

  @override
  Widget build(BuildContext context) {

    return ListTile(
      leading: Icon( menuItem.icon ),
      trailing: const Icon( Icons.arrow_forward_ios_outlined),
      title: Text( menuItem.title ),
      subtitle: Text( menuItem.subTitle ),
      onTap: () {
        //=== Formas de navegar propias de flutter ===
        // Navigator.of(context).push(  //
        //   MaterialPageRoute(
        //     builder: (context) => const ButtonsScreen(),
        //   ),
        // );

        // Navigator.pushNamed(context, menuItem.link);


        //=== Formas de navegar propias de go_router ===
        // context.push( menuItem.link ); 

        context.push( menuItem.link );
      },
    );
  }
}