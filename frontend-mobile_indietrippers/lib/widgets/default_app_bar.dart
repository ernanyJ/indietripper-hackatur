import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

AppBar defaultAppBar(String title) {
    return AppBar(
        title: Text(
          title,
          style: GoogleFonts.anton(
            textStyle: const TextStyle(
              color: mainColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
  }