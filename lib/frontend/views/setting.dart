import 'package:flutter/material.dart';
import 'package:ujianprojectflutter/frontend/views/login.dart';
import 'package:ujianprojectflutter/main.dart';

bool darkModeEnabled = false;

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationEnabled = false;

  void _toggleNotification(bool value) {
    setState(() {
      _notificationEnabled = value;
    });
  }

  ThemeMode _themeMode = ThemeMode.system;
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(Icons.notifications),
              title: Text(
                'Enable Notifications',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2!.color,
                ),
              ),
              trailing: Switch(
                value: _notificationEnabled,
                onChanged: _toggleNotification,
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(Icons.security),
              title: Text(
                'Privacy',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2!.color,
                ),
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(Icons.help),
              title: Text(
                'Help & Support',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2!.color,
                ),
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Profile',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2!.color,
                ),
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
