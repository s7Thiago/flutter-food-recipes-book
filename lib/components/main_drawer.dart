import 'package:flutter/material.dart';
import '../utils/routes.dart';

class MainDrawer extends StatelessWidget {
  Widget createItem(IconData icon, String label, Function onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomRight,
            color: Theme.of(context).accentColor,
            child: Text(
              'Let\'s Cook?',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          createItem(
            Icons.restaurant,
            'Meals',
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME),
          ),
          createItem(
            Icons.settings,
            'Settings',
            () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS),
          ),
        ],
      ),
    );
  }
}
