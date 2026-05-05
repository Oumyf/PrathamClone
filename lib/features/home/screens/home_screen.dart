import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pratham_clone/core/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Bienvenue sur ReadNet !',
          style: GoogleFonts.nunito(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
