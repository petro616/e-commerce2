import "package:ecomerce_app2/controller/address/add_controller.dart";
import "package:ecomerce_app2/core/class/handlingdataview.dart";
import "package:ecomerce_app2/core/constant/colors.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";

//ignore:camel_case_types
class Addaddress extends StatelessWidget {
  const Addaddress({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AddController());
    return Scaffold(
      backgroundColor: AppColor.colorscaffoldLogin,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueGrey,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 60),
              child: const Text(
                "Add New Address",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            )
          ],
        ),
      ),
      body: GetBuilder<AddController>(builder: (controllerpage) {
        return Handlingdataview(
            statusRequest: controllerpage.statusRequest,
            widget: Column(
              children: [
                if (controllerpage.kGooglePlex != null)
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        GoogleMap(
                          markers: controllerpage.markers.toSet(),
                          onTap: (latlong) {
                            controllerpage.addtomarker(latlong);
                          },
                          mapType: MapType.normal,
                          initialCameraPosition: controllerpage.kGooglePlex!,
                          onMapCreated: (GoogleMapController controllermap) {
                            controllerpage.completercontroller!
                                .complete(controllermap);
                          },
                        ),
                        Positioned(
                            bottom: 5,
                            child: MaterialButton(
                              minWidth: 200,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              onPressed: () {
                                controllerpage.gotoaddadressparttwo();
                              },
                              color: Colors.blueGrey,
                              child: const Text(
                                "Continue",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                      ],
                    ),
                  )
              ],
            ));
      }),
    );
  }
}
