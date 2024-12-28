import "package:ecomerce_app2/controller/address/viewaddress_controller.dart";
import "package:ecomerce_app2/core/class/handlingdataview.dart";
import "package:ecomerce_app2/core/constant/colors.dart";
import "package:ecomerce_app2/core/constant/routes.dart";
import "package:ecomerce_app2/data/model/addressmodel.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

//ignore:camel_case_types
class viewaddress extends StatelessWidget {
  const viewaddress({super.key});
  @override
  Widget build(BuildContext context) {
    ViewaddressController addressController = Get.put(ViewaddressController());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Get.toNamed(AppRoute.addaddress);
          },
          child: const Icon(
            Icons.add_location_alt_sharp,
            color: Colors.blueGrey,
            size: 30,
          ),
        ),
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(
          title: const Text("Address"),
        ),
        body: GetBuilder<ViewaddressController>(builder: (controller) {
          return Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                  itemCount: addressController.data.length,
                  itemBuilder: (context, i) {
                    return AddressView(
                      address: controller.data[i],
                      onDelete: () {
                        controller.deletedata(controller.data[i].adressId!);
                      },
                    );
                  }));
        }));
  }
}

class AddressView extends StatelessWidget {
  final Addressmodel address;
  final void Function()? onDelete;
  const AddressView({super.key, required this.address, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
      child: Card(
        color: AppColor.homepagecolorbackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: ListTile(
            title: Text(
              address.adressName!,
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            subtitle: Text(
              "${address.adressCity!} / ${address.adressStreet!}",
              style: const TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            trailing: IconButton(
                onPressed: onDelete,
                icon: (const Icon(
                  Icons.delete,
                  color: Colors.white,
                )))),
      ),
    );
  }
}
