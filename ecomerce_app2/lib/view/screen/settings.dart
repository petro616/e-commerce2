import 'package:ecomerce_app2/controller/settings_controller.dart';
import 'package:ecomerce_app2/core/constant/routes.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController settingsController = Get.put(SettingsController());
    return SizedBox(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(70),
                      bottomLeft: Radius.circular(70)),
                  color: Color.fromARGB(255, 223, 177, 104),
                ),
                height: 300,
                width: Get.width,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: [
                    const Text(
                      "Settings ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: const Icon(
                        EvaIcons.settingsOutline,
                        size: 40,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.only(top: 65, left: 12, right: 12),
                height: 800,
                width: Get.width,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 5, top: 5),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            padding: const EdgeInsets.all(5),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              backgroundImage: const AssetImage(
                                  "assets/images/—Pngtree—businessman user avatar wearing suit_8385663.png"),
                              radius: 35,
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(left: 15),
                              child: const Text(
                                "Hey Mester",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15, top: 5),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Account Settings",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoute.viewadress);
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        color: Colors.grey[200],
                        child: const ListTile(
                          title: Text(
                            "Address",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey),
                          ),
                          trailing: Icon(
                            Icons.location_on,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {},
                      child: Card(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        color: Colors.grey[200],
                        child: const ListTile(
                          title: Text(
                            "Contct Us",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey),
                          ),
                          trailing: Icon(
                            Icons.call,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {},
                      child: Card(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        color: Colors.grey[200],
                        child: const ListTile(
                          title: Text(
                            "About Us",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey),
                          ),
                          trailing: Icon(
                            Icons.info,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {},
                      child: Card(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        color: Colors.grey[200],
                        child: ListTile(
                            title: const Text(
                              "Notifications",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            ),
                            trailing: SizedBox(
                                width: 30,
                                child: Switch(
                                    activeColor: Colors.blueGrey,
                                    value: true,
                                    onChanged: (val) {}))),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        settingsController.logout();
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        color: Colors.grey[200],
                        child: const ListTile(
                          title: Text(
                            "Logout",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey),
                          ),
                          trailing: Icon(
                            EvaIcons.logOut,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
