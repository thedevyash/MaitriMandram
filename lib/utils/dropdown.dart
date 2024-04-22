import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sehyogini_frontned/utils/constants.dart';

class DropDown extends StatefulWidget {
  final List<DropdownMenuEntry> list;
  final String hint;
  final TextEditingController textEditingController;
  bool isfilled;

  DropDown({
    super.key,
    required this.list,
    required this.hint,
    required this.textEditingController,
    required this.isfilled,
  });

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 50, minHeight: 40),
      child: Center(
        child: DropdownMenu(
          onSelected: (value) {
            setState(() {});
          },
          // enableFilter: true

          menuStyle: MenuStyle(
            shape: MaterialStatePropertyAll(
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(4))),
            backgroundColor:
                const MaterialStatePropertyAll<Color>(Colors.white),
          ),
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: GoogleFonts.inter(
                fontSize: 12, fontWeight: FontWeight.w400, color: colors.purp),
            floatingLabelStyle: GoogleFonts.inter(
                fontSize: 12, fontWeight: FontWeight.w400, color: colors.purp),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            alignLabelWithHint: true,
            contentPadding: const EdgeInsets.all(8),
            activeIndicatorBorder: BorderSide.none,
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(9)),
                borderSide: BorderSide(color: const Color(0xffE0E0E0))),
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(9)),
                borderSide: BorderSide(color: const Color(0xffE0E0E0))),
            // isDense: true,
            hintStyle: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: const Color(0xffE0E0E0)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: const Color(0xffE0E0E0))),
          ),
          controller: widget.textEditingController,
          expandedInsets: EdgeInsets.zero,
          dropdownMenuEntries: widget.list,
          hintText: widget.hint,
          textStyle: GoogleFonts.poppins(),
        ),
      ),
    );
  }
}
