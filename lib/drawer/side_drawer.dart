import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes/approute/app_route.dart';
import 'package:shoes/provider/group_provider.dart';
import 'package:shoes/ui/login_flow_screen.dart' show LoginFlowScreen;


class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final groupProvider = context.watch<GroupProvider>();

    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.indigo,
              child: Column(
                children: [
                  const SizedBox(height: 50,),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white
                      ),
                      shape: BoxShape.circle
                    ),
                    child: Icon(Icons.perm_identity_sharp,size: 30,),
                  )
                ],
              ),
            ),
            // const DrawerHeader(
            //   decoration: BoxDecoration(
            //     color: Colors.green,
            //   ), // BoxDecoration
            //   child: UserAccountsDrawerHeader(
            //     decoration: BoxDecoration(color: Colors.green),
            //     accountName: Text(
            //       "Abhishek Mishra",
            //       style: TextStyle(fontSize: 18),
            //     ),
            //     accountEmail: Text("abhishekm977@gmail.com"),
            //     currentAccountPictureSize: Size.square(50),
            //     currentAccountPicture: CircleAvatar(
            //       backgroundColor: Color.fromARGB(255, 165, 255, 137),
            //       child: Text(
            //         "A",
            //         style: TextStyle(fontSize: 30.0, color: Colors.blue),
            //       ), // Text
            //     ), // CircleAvatar
            //   ), // UserAccountDrawerHeader
            // ), // DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.updateProfileScreen);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' My Course '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text(' Go Premium '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_label),
              title: const Text(' Saved Videos '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout,color: Colors.red,),
              title: const Text('LogOut',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.red),),
              onTap: () {
                groupProvider.tokenRemove();
                Navigator.pushNamed(context, AppRoutes.loginScreen);
              },
            ),
          ],
        ),
      );// Drawer

  }
}