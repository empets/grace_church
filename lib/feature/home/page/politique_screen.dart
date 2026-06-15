import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:google_fonts/google_fonts.dart';

import 'package:grace_church/core/constante/const.dart';
import 'package:grace_church/core/navigator_widget/custome_app_bar.dart';
import 'package:grace_church/gen/assets.gen.dart';

class PolitiqueScreen extends StatefulWidget {
  const PolitiqueScreen({super.key});

  @override
  State<PolitiqueScreen> createState() => _PolitiqueScreenState();
}

class _PolitiqueScreenState extends State<PolitiqueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        leading: IconButton(
          icon: SvgPicture.asset(assets.images.arrowBack.path),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: CustomeHeaderTitle(title: ''),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  securityPolicy,
                  style: GoogleFonts.roboto(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}