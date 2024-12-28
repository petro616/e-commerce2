import "package:eva_icons_flutter/eva_icons_flutter.dart";
import "package:flutter/material.dart";

class Customappbar extends StatelessWidget {
  final void Function()? onPressedSearch;
  final String titlehintText;
  final TextEditingController mycontroller;
  final void Function(String)? onChanged;
  const Customappbar(
      {super.key,
      required this.onPressedSearch,
      required this.titlehintText,
      required this.onChanged,
      required this.mycontroller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mycontroller,
      onChanged: onChanged,
      decoration: InputDecoration(
          prefixIcon: IconButton(
            onPressed: onPressedSearch,
            icon: const Icon(
              EvaIcons.search,
              color: Colors.grey,
              size: 30,
            ),
          ),
          hintText: titlehintText,
          hintStyle: const TextStyle(
              color: Colors.grey, fontSize: 13, fontWeight: FontWeight.bold),
          contentPadding: const EdgeInsets.all(5),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(200),
              borderSide: const BorderSide(color: Colors.white, width: 3)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: const BorderSide(color: Colors.white, width: 3)),
          filled: true,
          fillColor: Colors.white),
    );
  }
}
