import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 70,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome Home',
              style:
                  GoogleFonts.roboto(fontSize: 45, fontWeight: FontWeight.bold),
            ),
            Text(
              'IEEE PELS S2PE',
              style: GoogleFonts.roboto(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
