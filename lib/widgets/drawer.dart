import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageurl = "https://media.licdn.com/dms/image/D4E03AQH4CfduCM3Zmg/profile-displayphoto-shrink_800_800/0/1691679013483?e=2147483647&v=beta&t=A1bFkVy4k-svTe9N8uzd5ds1_TOUfcQLsc8VdEbb6P0";
    return Drawer(
      child: Container(
        color: Color(0xff403b58),
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text(
                  "Meet Sonchhatra",
                  style: TextStyle(color: Colors.white),
                ),
                accountEmail: Text("meetsonchhatra47@gmail.com",
                    style: TextStyle(color: Colors.white)),
                currentAccountPicture:
                    CircleAvatar(backgroundImage: NetworkImage(imageurl)),
              ),

            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email Us",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
