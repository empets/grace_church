import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_church/core/navigator_widget/custome_app_bar.dart';
import 'package:grace_church/gen/assets.gen.dart';

class MiseAjourScreen extends StatefulWidget {
  const MiseAjourScreen({super.key});

  @override
  State<MiseAjourScreen> createState() => _MiseAjourScreenState();
}

class _MiseAjourScreenState extends State<MiseAjourScreen> {
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
        title: CustomeHeaderTitle(title: 'Mise à jour'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Aucune mise à jour disponible',
                style: GoogleFonts.roboto(fontWeight: FontWeight.w400),
              ),
            ),

            GestureDetector(
              onTap: () async {
                
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'version actuelle : ',
                    style: GoogleFonts.roboto(fontWeight: FontWeight.w400),
                  ),
                  Text(
                    '2.4.01',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
