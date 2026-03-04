import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:novindus_task/utils/appcolors.dart';


class CustomTextStyle {
  static final TextStyle buttonTextStyle = GoogleFonts.poppins(
    color: Appcolor.primaryColor,
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle containerTextStyle = GoogleFonts.poppins(
    color: Appcolor.textColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle containerTittleStyle = GoogleFonts.poppins(
    color: Appcolor.darkColor,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static TextStyle highboldTxtStyle = GoogleFonts.poppins(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    color: Appcolor.textColor,
  );
  static final TextStyle containersubTittlestyle = GoogleFonts.poppins(
    color: Appcolor.buttonColor,
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );
  // static final TextStyle ultraBoldTextstyle = GoogleFonts.poppins(
  //   color: Appcolor.textColor,
  //   fontSize: 35,
  //   fontWeight: FontWeight.bold,
  // );

  static final TextStyle textFieldstyle = GoogleFonts.poppins(
    color: const Color.fromARGB(255, 157, 157, 157),
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );

  static final TextStyle textFieldlabelstyle = GoogleFonts.poppins(
    color: Appcolor.textColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static Widget getDoctorDescription() {
    return Text.rich(
      maxLines: 2,
      TextSpan(
        text: 'By creating or logging into an account you are agreeing',
        style: GoogleFonts.poppins(color: Colors.black, fontSize: 12),
        children: <TextSpan>[
          TextSpan(
            text: ' with our ',
            style: GoogleFonts.poppins(color: Colors.black, fontSize: 12),
          ),
          TextSpan(
            text: 'Terms and Conditions',
            style: GoogleFonts.poppins(color: Colors.blue, fontSize: 12),
          ),
          TextSpan(
            text: ' and ',
            style: GoogleFonts.poppins(color: Colors.black, fontSize: 12),
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: GoogleFonts.poppins(color: Colors.blue, fontSize: 12),
          ),
        ],
      ),
    );
  }
}