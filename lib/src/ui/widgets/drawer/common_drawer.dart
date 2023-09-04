import 'package:docapp/src/services/auth.dart';
import 'package:docapp/src/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../about_tile.dart';

class CommonDrawer extends StatelessWidget {
  // final ThemeClass c = Get.find<ThemeClass>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "Murtaxa Khalil",
            ),
            accountEmail: Text(
              "murxie@sofodynamix.com",
            ),
            // currentAccountPicture: new CircleAvatar(
            //   backgroundImage: new AssetImage(UIData.pkImage),
            // ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Logout",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.logout,
              color: Colors.brown,
            ),
            onTap: () {
              AuthService auth = Get.find<AuthService>();
              auth.logout();
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              "User",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.person,
              color: Color.fromARGB(255, 93, 93, 93),
            ),
            // onTap: () {
            //   c.changeThemeMode(ThemeMode.light);
            //   c.update();
            // },
            // onTap: () {
            //   c.changeTheme();
            // },
          ),
          ListTile(
            title: Text(
              "Lawyer",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.diversity_3_sharp,
              color: Color.fromARGB(255, 93, 93, 93),
            ),
            // onTap: () {
            //   c.changeThemeMode(ThemeMode.dark);
            //   c.update();
            // },
            // onTap: () {
            //   c.changeTheme();
            // },
          ),
          ListTile(
            title: Text(
              "Document List",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.settings,
              color: Color.fromARGB(255, 93, 93, 93),
            ),
            onTap: () {
              Get.toNamed(Routes.docListPage);
            },
          ),
          ListTile(
            title: Text(
              "Scan Document",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.settings,
              color: Color.fromARGB(255, 93, 93, 93),
            ),
            onTap: () {
              Get.toNamed(Routes.newDocument);
            },
          ),
          ListTile(
            title: Text(
              "Signature",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.settings,
              color: Color.fromARGB(255, 93, 93, 93),
            ),
            onTap: () {
              Get.toNamed(Routes.signatureRoute);
            },
          ),
          ListTile(
            title: Text(
              "Setting",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.settings,
              color: Color.fromARGB(255, 93, 93, 93),
            ),
            onTap: () {
              Get.toNamed(Routes.settingsRoute);
            },
          ),
          // Divider(),
          // MyAboutTile(),
        ],
      ),
    );
  }
}
