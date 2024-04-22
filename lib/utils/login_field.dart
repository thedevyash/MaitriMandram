import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sehyogini_frontned/utils/constants.dart';

class LoginField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hint;
  final Function()? any;
  final bool read;
  bool isfilled;
  final type;
  final limit;
  LoginField(
      {super.key,
      required this.hint,
      required this.textEditingController,
      this.any,
      this.read = false,
      required this.isfilled,
      this.type = TextInputType.text,
      this.limit = 20});

  @override
  State<LoginField> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxHeight: 60, minHeight: 40, maxWidth: width * 0.85),
      child: TextFormField(
        inputFormatters: [new LengthLimitingTextInputFormatter(widget.limit)],
        // maxLengthEnforcement: MaxLengthEnforcement.enforced,
        // maxLength: 10,
        keyboardType: widget.type,
        onChanged: (value) {
          setState(() {
            widget.isfilled = true;
          });
        },
        controller: widget.textEditingController,
        decoration: InputDecoration(
          hintText: widget.hint,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: const Color(0xffE0E0E0)),
          contentPadding: const EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(9)),
              borderSide: BorderSide(color: const Color(0xffE0E0E0))),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color(0xffE0E0E0)),
          ),
        ),
        onTap: widget.any,
        readOnly: widget.read,
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hint;
  final Function()? fun;
  final bool read;
  bool isfilled;
  // final limit;
  final type;
  PasswordField(
      {super.key,
      required this.hint,
      required this.textEditingController,
      this.fun,
      this.read = false,
      required this.isfilled,
      this.type = TextInputType.text
      // required this.limit
      });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 60, maxWidth: width * 0.85),
      child: Stack(alignment: Alignment.centerRight, children: [
        TextFormField(
          scrollPadding: EdgeInsets.only(bottom: 20),
          onChanged: (value) => setState(() {
            widget.isfilled = true;
          }),
          controller: widget.textEditingController,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: const Color(0xffE0E0E0)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: const EdgeInsets.all(10),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(9)),
              borderSide: BorderSide(
                color: const Color(0xffE0E0E0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colors.purpAcc)),
          ),
          obscureText: widget.read,
        ),
        IconButton(
            selectedIcon: SvgPicture.asset('assets/images/eye_open.svg'),
            isSelected: !widget.read,
            onPressed: widget.fun,
            icon: SvgPicture.asset('assets/images/eye_closed.svg')),
      ]),
    );
  }
}
