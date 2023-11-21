import 'package:coffee_app_ui/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ri.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 50,
        width: MediaQuery.of(context).size.width - 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorsPallete().searchBarFill,
        ),
        child: TextField(
          decoration: InputDecoration(
            fillColor: ColorsPallete().searchBarFill,
            filled: true,
            hintText: "Find Your Coffee..",
            contentPadding: const EdgeInsets.fromLTRB(10, 2, 5, 12),
            hintStyle: GoogleFonts.sourceCodePro(
              color: const Color(0xff525559),
            ),
            border: InputBorder.none,
            prefixIcon: const Padding(
              padding: EdgeInsets.only(right: 8, left: 8),
              child: Iconify(
                Ri.search_2_fill,
                color: Color(0xff525559),
              ),
            ),
            prefixIconConstraints:
                const BoxConstraints(maxHeight: 20, maxWidth: 40),
            prefixIconColor: const Color(0xff525559),
          ),
          style: GoogleFonts.sourceCodePro(
            color: const Color(0xff525559),
          ),
        ),
      ),
    );
  }
}
