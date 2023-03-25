import 'package:flutter/material.dart';
import 'package:lg_admin/admin/allUsers.dart';
import 'package:lg_admin/admin/checkExpertStatusPage.dart';
import 'package:lg_admin/admin/reportedPosts.dart';
import 'package:lg_admin/config/config.dart';
import 'package:lg_admin/admin/aboutUs.dart';
import 'package:lg_admin/widgets/drawer.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';

class adminHomePage extends StatefulWidget {
  PageController page = PageController();
  SideMenuController sideMenu = SideMenuController();

  void initState() {
    sideMenu.addListener((p0) {
      page.jumpToPage(p0);
    });
  }

  @override
  _adminHomePage createState() => _adminHomePage();
}

class _adminHomePage extends State<adminHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: LivingPlant.primaryColor,
        drawer: adminDrawer(),
        appBar: AppBar(
          flexibleSpace: Container(),
          title: const Text(
            "Living Green Admin Control",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          child: SafeArea(
            child: Container(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  children: const [
                    TabBar(tabs: [
                      Tab(
                          text: "All Users",
                          icon: Icon(
                            Icons.directions_car,
                            color: LivingPlant.whiteColor,
                          )),
                      Tab(icon: Icon(Icons.directions_transit)),
                      Tab(icon: Icon(Icons.directions_bike)),
                    ]),
                  ],
                )
                // child: GridView.count(
                //   padding: const EdgeInsets.all(15),
                //   mainAxisSpacing: 10,
                //   crossAxisSpacing: 10,
                //   primary: false,
                //   crossAxisCount: 2,
                //   children: [
                //     GestureDetector(
                //       onTap: () => {
                //         checkExpertStatus(),
                //       },
                //       child: Card(
                //         color: Color.fromARGB(255, 54, 31, 182),
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(8),
                //         ),
                //         elevation: 4,
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: const [
                //             Icon(
                //               Icons.person,
                //               color: Colors.white,
                //               size: 33,
                //             ),
                //             SizedBox(
                //               height: 5,
                //             ),
                //             Text(
                //               "Experts\n Requests",
                //               textAlign: TextAlign.center,
                //               style: TextStyle(
                //                 fontSize: 17,
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.white,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () => {
                //         Navigator.of(context)
                //             .push(MaterialPageRoute(builder: (_) => allUsers()))
                //       },
                //       child: Card(
                //         color: LivingPlant.primaryColor,
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(8),
                //         ),
                //         elevation: 4,
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: const [
                //             Icon(
                //               Icons.person,
                //               color: Colors.white,
                //               size: 33,
                //             ),
                //             SizedBox(
                //               height: 5,
                //             ),
                //             Text(
                //               "All\n Users",
                //               textAlign: TextAlign.center,
                //               style: TextStyle(
                //                 fontSize: 17,
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.white,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () => {
                //         Navigator.of(context).push(
                //             MaterialPageRoute(builder: (_) => const AboutUs()))
                //       },
                //       child: Card(
                //         color: LivingPlant.primaryColor,
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(8),
                //         ),
                //         elevation: 4,
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: const [
                //             Icon(
                //               Icons.info,
                //               color: Colors.white,
                //               size: 33,
                //             ),
                //             SizedBox(
                //               height: 5,
                //             ),
                //             Text(
                //               "About",
                //               style: TextStyle(
                //                 fontSize: 17,
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.white,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () => {
                //         Navigator.of(context).push(MaterialPageRoute(
                //             builder: (_) => const ReportedPosts()))
                //       },
                //       child: Card(
                //         color: LivingPlant.primaryColor,
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(8),
                //         ),
                //         elevation: 4,
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: const [
                //             Icon(
                //               Icons.not_interested_sharp,
                //               color: Colors.white,
                //               size: 33,
                //             ),
                //             SizedBox(
                //               height: 5,
                //             ),
                //             Text(
                //               "Reported Posts",
                //               style: TextStyle(
                //                 fontSize: 17,
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.white,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                ),
          ),
        ),
      ),
    );
  }

  checkExpertStatus() {
    Navigator.of(context);
    Route route =
        MaterialPageRoute(builder: (c) => const CheckExpertStatusPage());
    Navigator.push(context, route);
  }
}
