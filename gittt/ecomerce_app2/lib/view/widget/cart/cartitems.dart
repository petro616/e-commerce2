import 'package:ecomerce_app2/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Cartitems extends StatelessWidget {
  final String title;
  final String price;
  final String count;
  final String imagename;
  final void Function()? onadd;
  final void Function()? ondelete;
  const Cartitems(
      {super.key,
      required this.title,
      required this.price,
      required this.count,
      required this.onadd,
      required this.imagename,
      required this.ondelete});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.elliptical(100, 100),
              bottomRight: Radius.elliptical(100, 100))),
      margin: const EdgeInsets.only(left: 7, top: 7, right: 7),
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.elliptical(50, 50),
                      bottomRight: Radius.elliptical(50, 50)),
                  child: CachedNetworkImage(
                    imageUrl: "${Applink.imageitems}/$imagename",
                    fit: BoxFit.cover,
                    height: 135,
                  ))),
          Expanded(
              flex: 4,
              child: ListTile(
                title: Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.grey[700], fontWeight: FontWeight.bold),
                    )),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        price,
                        style: const TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "BebasNeue"),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: ondelete,
                            child: Container(
                                height: 23,
                                width: 23,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 18,
                                )),
                          ),
                          Container(
                              margin:
                                  const EdgeInsets.only(left: 12, right: 12),
                              child: Text(
                                count,
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "BebasNeue"),
                              )),
                          InkWell(
                            onTap: onadd,
                            child: Container(
                              height: 23,
                              width: 23,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
