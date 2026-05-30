import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grace_church/core/constante/const.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:grace_church/core/extension/extention.dart';
import 'package:grace_church/core/navigator_widget/custome_app_bar.dart';
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/gen/assets.gen.dart';

class RapportCellulePDFView extends StatelessWidget {
  RapportCellulePDFView({super.key, required this.rapportCellule});

  final RapportCelluleResponse rapportCellule;

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
        title: CustomeHeaderTitle(title: 'Rapport de cellule'),
      ),
      body: PdfPreview(build: (format) => generatePdf()),
    );
  }

  Future<Uint8List> generatePdf() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(20),

        build: (context) {
          return pw.Container(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                /// HEADER
                pw.Container(
                  padding: pw.EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 10.w,
                  ),
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(color: PdfColors.blue),
                    borderRadius: pw.BorderRadius.circular(8.r),
                    gradient: pw.LinearGradient(
                      begin: pw.Alignment.topCenter,
                      end: pw.Alignment.bottomCenter,
                      colors: [
                        PdfColors.white,
                        PdfColor.fromHex("E3F2FD"),
                        PdfColor.fromHex("90CAF9"),
                      ],
                    ),
                  ),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Text(
                            "EGLISE PROTESTANTE BAPTISTE OEUVRES ET MISSIONS INTERNATIONALE",
                            style: pw.TextStyle(
                              fontSize: 13.sp,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "01 B.P.7184 ABIDJAN 01 / 21 B.P. 1401 ABIDJAN 21 / 03 B.P. 1032 ABIDJAN 03",
                            style: pw.TextStyle(fontSize: 12.sp),
                          ),
                          pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            children: [
                              pw.Text(
                                "BLOC DE L'ENCADREMENT ET DE LA CROISSANCE",
                                style: pw.TextStyle(
                                  fontSize: 12.sp,
                                  color: PdfColors.red,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                              pw.Text(
                                "EGLISES DE MAISON",
                                style: pw.TextStyle(
                                  fontSize: 12.sp,
                                  color: PdfColors.blue700,
                                ),
                              ),
                            ],
                          ),

                          pw.Text(
                            "Tél : 225-0708734672/225-0585054309/225-0102369936/225-0707526646",
                            style: pw.TextStyle(fontSize: 12.sp),
                          ),
                          pw.Row(
                            children: [
                              pw.Text(
                                "Email : ",
                                style: pw.TextStyle(
                                  fontSize: 12.sp,
                                  color: PdfColors.black,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                              pw.Text(
                                "ieglisedemaison20@gmail.com/ eglisedemaison@yahoo.fr",
                                style: pw.TextStyle(
                                  fontSize: 12.sp,
                                  decoration: pw.TextDecoration.underline,
                                  decorationColor: PdfColors.blue700,
                                  decorationStyle: pw.TextDecorationStyle.solid,

                                  color: PdfColors.blue700,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                pw.Align(
                  child: pw.Container(
                    margin: pw.EdgeInsets.only(top: 8.h),
                    padding: const pw.EdgeInsets.all(10),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.red),
                      borderRadius: pw.BorderRadius.circular(5),
                    ),
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text(
                          "NOUVELLE FICHE DE RAPPORT HEBDOMADAIRE - OUVRIER",
                          style: pw.TextStyle(
                            fontSize: 14.sp,
                            color: PdfColors.red,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                pw.Align(
                  child: pw.Container(
                    margin: pw.EdgeInsets.only(top: 5.h, bottom: 7.h),
                    padding: const pw.EdgeInsets.all(10),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.red),
                      color: PdfColors.orange100,
                      borderRadius: pw.BorderRadius.circular(5),
                    ),
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text(
                          "NOUVELLE FICHE DE RAPPORT HEBDOMADAIRE - OUVRIER",
                          style: pw.TextStyle(
                            fontSize: 14.sp,
                            color: PdfColors.blue700,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              
                // TABLEAU ADIMANISTRATION
                pw.Container(
                  margin: pw.EdgeInsets.only(right: 10.h),
                  child: pw.Row(
                    children: [
                      pw.Table(
                        border: pw.TableBorder.all(color: PdfColors.grey300),
                        tableWidth: pw.TableWidth.min,
                        children: [
                          /// HEADER TABLE
                          pw.TableRow(
                            decoration: const pw.BoxDecoration(
                              color: PdfColors.blue,
                            ),
                            children: [
                              tableCell(
                                "ENTITE",
                                isHeader: true,
                              ), //<< COLUMNE 1
                              tableCell("N°", isHeader: true), //<< COLUMNE 3
                              tableCell(
                                "NOM ET PRENOM",
                                isHeader: true,
                              ), //<< COLUMNE 1
                              tableCell(
                                "CONTACT",
                                isHeader: true,
                              ), //<< COLUMNE 1
                            ],
                          ),

                          /// LIGNES
                          pw.TableRow(
                            children: [
                              tableCell("ZONE"), //<< LGINE 1
                              tableCell(rapportCellule.codeZone), //<< LGINE 1
                              tableCell(
                                rapportCellule.fullNameRespoZone,
                              ), //<< LGINE 1
                              tableCell(
                                rapportCellule.contactRespoZone,
                              ), //<< LGINE 1
                            ],
                          ),
                          pw.TableRow(
                            children: [
                              tableCell("SECTEUE"), //<< LGINE 2
                              tableCell(
                                rapportCellule.codeSecteur,
                              ), //<< LGINE 2
                              tableCell(
                                rapportCellule.fullNameRespoSecteur,
                              ), //<< LGINE 2
                              tableCell(
                                rapportCellule.contactRespoSecteur,
                              ), //<< LGINE 1
                            ],
                          ),

                          pw.TableRow(
                            children: [
                              tableCell("Eglise de M."), //<< LGINE 3
                              tableCell(
                                rapportCellule.codeCellule,
                              ), //<< LGINE 3
                              tableCell(
                                rapportCellule.fullNameRespoCellule,
                              ), //<< LGINE 3
                              tableCell(
                                rapportCellule.contactRespoCellule,
                              ), //<< LGINE 1
                            ],
                          ),
                        ],
                      ),

                      pw.SizedBox(width: 2.w),

                      // SECTION DIRECTOION
                      pw.Table(
                        border: pw.TableBorder.all(color: PdfColors.grey300),
                        children: [
                          pw.TableRow(
                            decoration: const pw.BoxDecoration(
                              color: PdfColors.blue,
                            ),
                            children: [
                              tableCell(
                                "SOUS-DIRECTION",
                                isHeader: true,
                              ), //<< COLUMNE 1
                              tableCell("", isHeader: true), //<< COLUMNE 3
                            ],
                          ),

                          pw.TableRow(
                            children: [
                              tableCell("DATE"), //<< LGINE 1
                              tableCell(
                                rapportCellule.jourCellule.substring(0, 10),
                              ), //<< LGINE 1
                            ],
                          ),
                          pw.TableRow(
                            children: [
                              tableCell("LIEU"), //<< LGINE 1
                              tableCell(rapportCellule.lieu), //<< LGINE 1
                            ],
                          ),
                          pw.TableRow(
                            children: [
                              tableCell("OFFRANDE"), //<< LGINE 2
                              tableCell(
                                "${double.parse(rapportCellule.offrande).parseAmount()} fcfa",
                              ), //<< LGINE 2
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                pw.SizedBox(height: 13.h),

                // EFFECTIF SECTION
                pw.Stack(
                  children: [
                    pw.Column(
                      children: [
                        pw.Row(
                          children: [
                            pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                buildCard(
                                  padding: pw.EdgeInsets.symmetric(
                                    horizontal: 43.w,
                                    vertical: 5.h,
                                  ),
                                  isDefaultBorder: false,
                                  customeBorder: pw.Border(
                                    top: pw.BorderSide(color: PdfColors.black),
                                    right: pw.BorderSide(color: PdfColors.grey),
                                    left: pw.BorderSide(color: PdfColors.grey),
                                  ),
                                  child: pw.Row(
                                    children: [
                                      pw.Text("EFFECTIF", style: pw.TextStyle(fontSize: 9.sp)),
                                      pw.SizedBox(width: 1.w),
                                    ],
                                  ),
                                ),
                                pw.Row(
                                  children: [
                                    buildCard(
                                      padding: pw.EdgeInsets.symmetric(
                                        horizontal: 13.7.w,
                                        vertical: 3.h,
                                      ),
                                      isDefaultBorder: true,
                                      customeBorder: pw.Border(
                                        top: pw.BorderSide(
                                          color: PdfColors.black,
                                        ),
                                      ),
                                      child: pw.Row(
                                        children: [pw.Text("Chrét.Bapt",style: pw.TextStyle(fontSize: 9.sp))],
                                      ),
                                    ),
                                    buildCardValue(
                                      padding: pw.EdgeInsets.symmetric(
                                        horizontal: 6.9.w,
                                        vertical: 3.h,
                                      ),
                                      isDefaultBorder: true,
                                      customeBorder: pw.Border(
                                        top: pw.BorderSide(
                                          color: PdfColors.black,
                                        ),
                                      ),
                                      child: pw.Row(children: [pw.Text("01",style: pw.TextStyle(fontSize: 9.sp))]),
                                    ),
                                  ],
                                ),
                                pw.Row(
                                  children: [
                                    buildCard(
                                      padding: pw.EdgeInsets.symmetric(
                                       horizontal: 10.4.w,
                                        vertical: 3.h,
                                      ),
                                      isDefaultBorder: true,
                                      customeBorder: pw.Border(
                                        top: pw.BorderSide(
                                          color: PdfColors.black,
                                        ),
                                      ),
                                      child: pw.Row(
                                        children: [pw.Text("Chré.N.Bapt",style: pw.TextStyle(fontSize: 9.sp))],
                                      ),
                                    ),
                                    buildCardValue(
                                      padding: pw.EdgeInsets.symmetric(
                                        horizontal: 6.9.w,
                                        vertical: 3.h,
                                      ),
                                      isDefaultBorder: true,
                                      customeBorder: pw.Border(
                                        top: pw.BorderSide(
                                          color: PdfColors.black,
                                        ),
                                      ),
                                      child: pw.Row(children: [pw.Text("01",style: pw.TextStyle(fontSize: 9.sp))]),
                                    ),
                                  ],
                                ),
                                pw.Row(
                                  children: [
                                    buildCard(
                                      padding: pw.EdgeInsets.symmetric(
                                        horizontal: 25.w,
                                        vertical: 3.h,
                                      ),
                                      isDefaultBorder: true,
                                      customeBorder: pw.Border(
                                        top: pw.BorderSide(
                                          color: PdfColors.black,
                                        ),
                                      ),
                                      child: pw.Row(
                                        mainAxisAlignment:
                                            pw.MainAxisAlignment.start,
                                        children: [pw.Text("Total",style: pw.TextStyle(fontSize: 9.sp))],
                                      ),
                                    ),
                                    buildCardValue(
                                      padding: pw.EdgeInsets.symmetric(
                                        horizontal: 4.w,
                                        vertical: 3.h,
                                      ),
                                      isDefaultBorder: true,
                                      customeBorder: pw.Border(
                                        top: pw.BorderSide(
                                          color: PdfColors.black,
                                        ),
                                      ),
                                      child: pw.Row(children: [pw.Text("201",style: pw.TextStyle(fontSize: 9.sp))]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // ROW TOW
                            pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                buildCard(
                                  padding: pw.EdgeInsets.symmetric(
                                    horizontal: 73.w,
                                    vertical: 1.h,
                                  ),
                                  isDefaultBorder: false,
                                  customeBorder: pw.Border(
                                    top: pw.BorderSide(
                                      color: PdfColors.black,
                                      style: pw.BorderStyle.solid,
                                    ),
                                    // right: pw.BorderSide(
                                    //   color: PdfColors.black,
                                    //   style: pw.BorderStyle.solid,
                                    // ),
                                  ),
                                  child: pw.Column(
                                    children: [
                                      pw.Row(
                                        children: [pw.Text("EGLISE DE MAISON",style: pw.TextStyle(fontSize: 9.sp))],
                                      ),
                                      pw.SizedBox(height: 10.h),
                                    ],
                                  ),
                                ),
                                pw.Row(
                                  children: [
                                    buildCard(
                                      
                                      width: 55.w,
                                      padding: pw.EdgeInsets.symmetric(
                                        horizontal: 7.w,
                                        vertical: 12.h,
                                      ),
                                      isDefaultBorder: true,
                                      customeBorder: pw.Border(
                                        top: pw.BorderSide(
                                          color: PdfColors.black,
                                          style: pw.BorderStyle.solid,
                                        ),
                                      ),
                                      child: pw.Column(
                                        children: [
                                              pw.Text(
                                                "CETTE",
                                                style: pw.TextStyle(
                                                  fontSize: 10.sp,
                                                ),
                                              ),
                                            pw.Text(
                                                "SEMAINE",
                                                style: pw.TextStyle(
                                                  fontSize: 9.sp,
                                                ),
                                              ),
                                        ],
                                      ),
                                    ),

                                    buildCard(
                                      width: 55.w,
                                      padding: pw.EdgeInsets.symmetric(
                                        horizontal: 11.4.w,
                                        vertical: 12.h,
                                      ),
                                      isDefaultBorder: true,
                                      customeBorder: pw.Border(
                                        top: pw.BorderSide(
                                          color: PdfColors.black,
                                          style: pw.BorderStyle.solid,
                                        ),
                                      ),
                                      child: pw.Column(
                                        children: [
                                          
                                           pw.Text(
                                                "T",
                                                style: pw.TextStyle(
                                                  fontSize: 10.sp,
                                                ),
                                              ),
                                               pw.Text(
                                                "T",
                                                style: pw.TextStyle(
                                                  fontSize: 9.sp,
                                                  color: PdfColors.white
                                                ),
                                              ),
                                        ],
                                      ),
                                    ),
                                    buildCard(
                                      width: 55.w,
                                      padding: pw.EdgeInsets.symmetric(
                                        horizontal: 4.w,
                                        vertical: 12.h,
                                      ),
                                      isDefaultBorder: true,
                                      customeBorder: pw.Border(
                                        top: pw.BorderSide(
                                          color: PdfColors.black,
                                          style: pw.BorderStyle.solid,
                                        ),
                                      ),
                                      child: pw.Column(
                                        children: [
                                         pw.Text(
                                                "SEMAINE",
                                                style: pw.TextStyle(
                                                  fontSize: 10.sp,
                                                ),
                                              ),
                                           pw.Text(
                                                "PASSEE",
                                                style: pw.TextStyle(
                                                  fontSize: 9.sp,
                                                ),
                                              ),
                                          
                                        ],
                                      ),
                                    ),

                                    buildCard(
                                      width: 55.w,
                                      padding: pw.EdgeInsets.symmetric(
                                        horizontal: 11.4.w,
                                        vertical: 12.h,
                                      ),
                                      isDefaultBorder: true,
                                      customeBorder: pw.Border(
                                        top: pw.BorderSide(
                                          color: PdfColors.black,
                                          style: pw.BorderStyle.solid,
                                        ),
                                      ),
                                      child: pw.Column(
                                        children: [
                                          pw.Row(
                                            children: [
                                              pw.Text(
                                                "T ",
                                                style: pw.TextStyle(
                                                  fontSize: 10.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                           pw.Text(
                                                "T ",
                                                style: pw.TextStyle(
                                                  fontSize: 9.sp,
                                                  color: PdfColors.white,
                                                ),
                                              ),
                                         
                                        ],
                                      ),
                                    ),

                                    buildCard(
                                      width: 55.w,
                                      padding: pw.EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                        vertical: 12.h,
                                      ),
                                      isDefaultBorder: true,
                                      customeBorder: pw.Border(
                                        top: pw.BorderSide(
                                          color: PdfColors.black,
                                          style: pw.BorderStyle.solid,
                                        ),
                                      ),
                                      child: pw.Column(
                                        children: [
                                          pw.Row(
                                            children: [
                                              pw.Text(
                                                "ECART",
                                                style: pw.TextStyle(
                                                  fontSize: 10.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          pw.Text(
                                            "ECART",
                                            style: pw.TextStyle(
                                              fontSize: 9.sp,
                                              color: PdfColors.white                                            ),
                                          ),
                                          // pw.SizedBox(height: 8.h),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        // SUB EFFECTIF SECTION
                        pw.Row(
                          children: [
                            pw.Container(
                              height: 0.24.sh,
                              alignment: pw.Alignment.center,
                              padding: pw.EdgeInsets.symmetric(
                                horizontal: 6.w,
                                vertical: 10.h,
                              ),
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(color: PdfColors.black),
                              ),
                              child: pw.Transform.rotateBox(
                                angle: 1.57,
                                child: pw.Text("ASSISTANCE",),
                              ),
                            ),
                            pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                //--->> ROW ASSISTANCE
                                pw.Row(
                                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  children: [
                                    buildCard(
                                      padding: pw.EdgeInsets.symmetric(
                                        horizontal: 19.1.w,
                                        vertical: 5.h,
                                      ),
                                      isDefaultBorder: false,
                                      customeBorder: pw.Border(
                                        bottom: pw.BorderSide(
                                          color: PdfColors.black,
                                          style: pw.BorderStyle.solid,
                                        ),
                                      ),
                                      child: pw.Text(
                                        "Chrétiens baptisés",
                                        style: pw.TextStyle(fontSize: 8.sp),
                                      ),
                                    ),
                                    // Columne cette semaine
                                    buildCardValue(
                                       width: 55.w,
                                      padding: pw.EdgeInsets.symmetric(
                                        horizontal: 4.1.w,
                                        vertical: 4.9.h,
                                      ),
                                      isDefaultBorder: true,
                                      customeBorder: pw.Border.all(
                                        color: PdfColors.grey300,
                                      ),
                                      child: pw.Text("0S",style: pw.TextStyle(fontSize: 8.sp),),
                                    ),
                                    // Columne cette semaine T
                                    buildCardValue(
                                       width: 29.1.w,
                                      padding: pw.EdgeInsets.symmetric(
                                        horizontal: 5.w,
                                        vertical: 5.0.h,
                                      ),
                                      isDefaultBorder: true,
                                      customeBorder: pw.Border.all(
                                        color: PdfColors.black,
                                      ),
                                      child: pw.Text("00",style: pw.TextStyle(fontSize: 8.sp),),
                                    ),
                                    // Columne semaine passé
                                    buildCardValue(
                                      width: 52.5.w,
                                      padding: pw.EdgeInsets.symmetric(
                                        horizontal: 5.w,
                                        vertical: 5.0.h,
                                      ),
                                      isDefaultBorder: true,
                                      customeBorder: pw.Border.all(
                                        color: PdfColors.black,
                                      ),
                                      child: pw.Text("00",style: pw.TextStyle(fontSize: 8.sp),),
                                    ),
                                    // Columne semaine passé T
                                    buildCardValue(
                                      width: 32.w,
                                      padding: pw.EdgeInsets.symmetric(
                                        horizontal: 5.w,
                                       vertical: 5.0.h,
                                      ),
                                      isDefaultBorder: true,
                                      customeBorder: pw.Border.all(
                                        color: PdfColors.black,
                                      ),
                                      child: pw.Text("00",style: pw.TextStyle(fontSize: 8.sp)),
                                    ),
                                    // Columne ecart
                                    buildCardValue(
                                      width: 54.w,
                                      padding: pw.EdgeInsets.symmetric(
                                        horizontal: 5.w,
                                        vertical: 5.0.h,
                                      ),
                                      isDefaultBorder: true,
                                      customeBorder: pw.Border.all(
                                        color: PdfColors.black,
                                      ),
                                      child: pw.Text("EC",style: pw.TextStyle(fontSize: 8.sp)),
                                    ),
                                  ],
                                ),
                               
                                //--->> Non chrétiens
                                ...List.generate(3, (index){
                                  return   pw.Row(
                                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  children: [
                                    buildCard(
                                      padding: pw.EdgeInsets.symmetric(
                                        horizontal: 5.3.w,
                                        vertical: 12.1.h,
                                      ),
                                      isDefaultBorder: true,
                                      customeBorder: pw.Border.all(
                                        color: PdfColors.grey300,
                                      ),
                                      child: pw.Text(
                                        "Chrétiens\nNon\nbaptisés",
                                        style: pw.TextStyle(fontSize: 8.sp),
                                      ),
                                    ),
                                    pw.Column(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Row(
                                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                                          mainAxisAlignment: pw.MainAxisAlignment.start,
                                          children: [
                                            buildCardValue(
                                              width: 59.w,
                                              padding: pw.EdgeInsets.symmetric(
                                                horizontal: 5.w,
                                                vertical: 4.h,
                                              ),
                                              isDefaultBorder: true,
                                              customeBorder: pw.Border.all(
                                                color: PdfColors.black,
                                              ),
                                              child: pw.Text(
                                                "Tout-petits",
                                                style: pw.TextStyle(
                                                  fontSize: 8.sp,
                                                ),
                                              ),
                                            ),
                                            // Columne Cette semaine
                                            buildCardValue(
                                              width: 55.w,
                                              padding: pw.EdgeInsets.symmetric(
                                                horizontal: 5.w,
                                                vertical: 4.h,
                                              ),
                                              isDefaultBorder: true,
                                              customeBorder: pw.Border.all(
                                                color: PdfColors.black,
                                              ),
                                              child: pw.Text("00", style: pw.TextStyle(
                                                  fontSize: 8.sp,
                                                ),),
                                            ),
                                          ],
                                        ),
                                        pw.Row(
                                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                                          mainAxisAlignment: pw.MainAxisAlignment.start,
                                          children: [
                                            buildCardValue(
                                              width: 59.w,
                                              padding: pw.EdgeInsets.symmetric(
                                                horizontal: 5.w,
                                                vertical: 4.h,
                                              ),
                                              isDefaultBorder: true,
                                              customeBorder: pw.Border.all(
                                                color: PdfColors.black,
                                              ),
                                              child: pw.Text(
                                                "cadets",
                                                style: pw.TextStyle(
                                                  fontSize: 8.sp,
                                                ),
                                              ),
                                            ),
                                            // Columne Cette semaine
                                            buildCardValue(
                                              width: 55.w,
                                              padding: pw.EdgeInsets.symmetric(
                                                horizontal: 5.w,
                                                vertical: 4.h,
                                              ),
                                              isDefaultBorder: true,
                                              customeBorder: pw.Border.all(
                                                color: PdfColors.black,
                                              ),
                                              child: pw.Text("00", style: pw.TextStyle(
                                                  fontSize: 8.sp,
                                                ),),
                                            ),
                                          ],
                                        ),
                                         pw.Row(
                                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                                          mainAxisAlignment: pw.MainAxisAlignment.start,
                                          children: [
                                            buildCardValue(
                                               width: 59.w,
                                              padding: pw.EdgeInsets.symmetric(
                                                horizontal: 5.w,
                                                vertical: 4.h,
                                              ),
                                              isDefaultBorder: true,
                                              customeBorder: pw.Border.all(
                                                color: PdfColors.black,
                                              ),
                                              child: pw.Text(
                                                "Juniors",
                                                style: pw.TextStyle(
                                                  fontSize: 8.sp,
                                                ),
                                              ),
                                            ),
                                            // Columne Cette semaine
                                            buildCardValue(
                                              width: 55.w,
                                              padding: pw.EdgeInsets.symmetric(
                                                horizontal: 5.w,
                                                vertical: 4.h,
                                              ),
                                              isDefaultBorder: true,
                                              customeBorder: pw.Border.all(
                                                color: PdfColors.black,
                                              ),
                                              child: pw.Text("00", style: pw.TextStyle(
                                                  fontSize: 8.sp,
                                                ),),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    pw.Row(
                                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                                      children: [
                                        // Columne Cette semaine T
                                        buildCardValue(
                                          width: 29.5.w,
                                          padding: pw.EdgeInsets.symmetric(
                                            horizontal: 1.w,
                                            vertical: 20.h,
                                          ),
                                          isDefaultBorder: true,
                                          child: pw.Text("0T", style: pw.TextStyle(fontSize: 8.sp,),),
                                        ),
                                        // Columne semaine passe
                                        pw.Column(
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.start,
                                          children: [
                                            buildCardValue(
                                              width: 52.w,
                                              padding: pw.EdgeInsets.symmetric(
                                                horizontal: 1.w,
                                                vertical: 4.h,
                                              ),
                                              isDefaultBorder: true,
                                              customeBorder: pw.Border.all(
                                                color: PdfColors.black,
                                              ),
                                              child: pw.Text("00", style: pw.TextStyle(fontSize: 8.sp,),),
                                            ),
                                            buildCardValue(
                                              width: 52.w,
                                              padding: pw.EdgeInsets.symmetric(
                                                horizontal: 1.w,
                                                vertical: 4.h,
                                              ),
                                              isDefaultBorder: true,
                                              customeBorder: pw.Border.all(
                                                color: PdfColors.black,
                                              ),
                                              child: pw.Text("00", style: pw.TextStyle(fontSize: 8.sp,),),
                                            ),
                                            buildCardValue(
                                              width: 52.w,
                                              padding: pw.EdgeInsets.symmetric(
                                                horizontal: 1.w,
                                                vertical: 4.h,
                                              ),
                                              isDefaultBorder: true,
                                              customeBorder: pw.Border.all(
                                                color: PdfColors.black,
                                              ),
                                              child: pw.Text("00", style: pw.TextStyle(fontSize: 8.sp,),),
                                            ),
                                          ],
                                        ),
                                        // Columne semaine passé T
                                        buildCardValue(
                                          width: 31.2.w,
                                          padding: pw.EdgeInsets.symmetric(
                                            horizontal: 1.w,
                                            vertical: 20.2.h,
                                          ),
                                          isDefaultBorder: true,
                                          child: pw.Text("T", style: pw.TextStyle(fontSize: 8.sp,),),
                                        ),
                                        // Columne ECART
                                        buildCardValue(
                                          width: 54.w,
                                          padding: pw.EdgeInsets.symmetric(
                                            horizontal: 1.w,
                                            vertical: 20.1.h,
                                          ),
                                          isDefaultBorder: true,
                                          child: pw.Text("EC", style: pw.TextStyle(fontSize: 8.sp,),),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                                })
                               
                               ],
                            ),
                          ],
                        ),
                        //
                        ...List.generate(rapportpdfItem.length-2, (index) {return    pw.Row(
                          children: [
                            buildCardValue(
                              width: 129.w,
                              isDefaultBorder: true,
                              child: pw.Text(
                                "Total",
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 7.sp,
                                ),
                              ),
                            ),
                            buildCardValue(
                              width: 84.1.w,
                              isDefaultBorder: true,
                              child: pw.Text(
                                "Total",
                                style: pw.TextStyle(
                                  fontSize: 7.sp,
                                ),
                              ),
                            ),
                            // Semaine passer
                            buildCardValue(
                              width: 52.w,
                              padding: pw.EdgeInsets.symmetric(
                                horizontal: 1.w,
                                vertical: 4.h,
                              ),
                              isDefaultBorder: true,
                              customeBorder: pw.Border.all(
                                color: PdfColors.black,
                              ),
                              child: pw.Text(
                                "00",
                                style: pw.TextStyle(
                                  fontSize: 7.sp,
                                ),
                              ),
                            ),
                            // Columne semaine passé T
                            buildCardValue(
                              width: 31.2.w,
                               padding: pw.EdgeInsets.symmetric(
                                horizontal: 1.w,
                                vertical: 4.h,
                              ),
                              isDefaultBorder: true,
                              child: pw.Text("T",style: pw.TextStyle(
                                  fontSize: 7.sp,
                                ),),
                            ),
                            // Columne ECART
                            buildCardValue(
                              width: 54.w,
                              padding: pw.EdgeInsets.symmetric(
                                horizontal: 1.w,
                                vertical: 4.h,
                              ),
                              isDefaultBorder: true,
                              child: pw.Text("EC",style: pw.TextStyle(
                                  fontSize: 7.sp,
                                ),),
                            ),
                          ],
                        );
                     }).toList(),
                      ],
                    ),
                    
                    pw.Positioned(
                      right: 0.w,
                      top: 0,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Row(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              buildCard(
                                padding: pw.EdgeInsets.symmetric(
                                  horizontal: 5.w,
                                  vertical: 17.h,
                                ),
                                isDefaultBorder: true,
                                child: pw.Text(
                                  "N°",
                                  style: pw.TextStyle(fontSize: 9.sp),
                                ),
                              ),
                              buildCard(
                                padding: pw.EdgeInsets.symmetric(
                                  horizontal: 7.w,
                                  vertical: 12.2.h,
                                ),
                                isDefaultBorder: true,
                                child: pw.Text(
                                  "Nom et\nprénoms",
                                  style: pw.TextStyle(fontSize: 9.sp),
                                ),
                              ),
                              pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  buildCard(
                                    padding: pw.EdgeInsets.symmetric(
                                      horizontal: 36.w,
                                      vertical: 7.h,
                                    ),
                                    isDefaultBorder: true,
                                    child: pw.Text(
                                      "Status",
                                      style: pw.TextStyle(fontSize: 9.sp),
                                    ),
                                  ),
                                  pw.Row(
                                    children: [
                                      buildCard(
                                        padding: pw.EdgeInsets.symmetric(
                                          horizontal: 9.w,
                                          vertical: 4.9.h,
                                        ),
                                        isDefaultBorder: true,
                                        child: pw.Text(
                                          "Abscent",
                                          style: pw.TextStyle(fontSize: 9.sp),
                                        ),
                                      ),
                                      buildCard(
                                        padding: pw.EdgeInsets.symmetric(
                                          horizontal: 7.w,
                                          vertical: 4.9.h,
                                        ),
                                        isDefaultBorder: true,
                                        child: pw.Text(
                                          "Abscent",
                                          style: pw.TextStyle(fontSize: 9.sp),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          pw.Row(
                            children: [
                              buildCard(
                                padding: pw.EdgeInsets.symmetric(
                                  horizontal: 6.w,
                                  vertical: 16.h,
                                ),
                                isDefaultBorder: false,
                                customeBorder: null,
                                child: pw.Text(
                                  "01",
                                  style: pw.TextStyle(fontSize: 9.sp),
                                ),
                              ),
                              buildCardValue(
                                width: 49.w,
                                padding: pw.EdgeInsets.symmetric(
                                  horizontal: 4.w,
                                  vertical: 15.3.h,
                                ),
                                isDefaultBorder: true,
                                customeBorder: null,
                                child: pw.Text(
                                  "Name°",
                                  style: pw.TextStyle(fontSize: 9.sp),
                                ),
                              ),
                              buildCardValue(
                                width: 49.w,
                                padding: pw.EdgeInsets.symmetric(
                                  horizontal: 4.w,
                                  vertical: 16.h,
                                ),
                                isDefaultBorder: true,
                                child: pw.Text(
                                  "N°",
                                  style: pw.TextStyle(fontSize: 9.sp),
                                ),
                              ),
                              buildCardValue(
                                width: 49.w,
                                padding: pw.EdgeInsets.symmetric(
                                  horizontal: 4.w,
                                  vertical: 16.h,
                                ),
                                isDefaultBorder: true,
                                child: pw.Text(
                                  "N°",
                                  style: pw.TextStyle(fontSize: 9.sp),
                                ),
                              ),
                            ],
                          ),
                          pw.Row(
                            children: [
                              buildCard(
                                padding: pw.EdgeInsets.symmetric(
                                  horizontal: 6.w,
                                  vertical: 14.4.h,
                                ),
                                isDefaultBorder: true,
                                child: pw.Text(
                                  "02",
                                  style: pw.TextStyle(fontSize: 9.sp),
                                ),
                              ),
                              buildCardValue(
                                width: 49.w,
                                padding: pw.EdgeInsets.symmetric(
                                  horizontal: 4.w,
                                  vertical: 15.h,
                                ),
                                isDefaultBorder: true,
                                child: pw.Text(
                                  "N°",
                                  style: pw.TextStyle(fontSize: 9.sp),
                                ),
                              ),
                              buildCardValue(
                                width: 49.w,
                                padding: pw.EdgeInsets.symmetric(
                                  horizontal: 4.w,
                                  vertical: 15.h,
                                ),
                                isDefaultBorder: true,
                                child: pw.Text(
                                  "N°",
                                  style: pw.TextStyle(fontSize: 9.sp),
                                ),
                              ),
                              buildCardValue(
                                width: 49.w,
                                padding: pw.EdgeInsets.symmetric(
                                  horizontal: 4.w,
                                  vertical: 15.h,
                                ),
                                isDefaultBorder: true,
                                child: pw.Text(
                                  "N°",
                                  style: pw.TextStyle(fontSize: 9.sp),
                                ),
                              ),
                            ],
                          ),
                          pw.Row(
                            children: [
                              buildCard(
                                padding: pw.EdgeInsets.symmetric(
                                  horizontal: 6.w,
                                  vertical: 14.3.h,
                                ),
                                isDefaultBorder: true,
                                child: pw.Text(
                                  "03",
                                  style: pw.TextStyle(fontSize: 9.sp),
                                ),
                              ),
                              buildCardValue(
                                width: 49.w,
                                padding: pw.EdgeInsets.symmetric(
                                  horizontal: 4.w,
                                  vertical: 15.h,
                                ),
                                isDefaultBorder: true,
                                child: pw.Text(
                                  "N°",
                                  style: pw.TextStyle(fontSize: 9.sp),
                                ),
                              ),
                              buildCardValue(
                                width: 49.w,
                                padding: pw.EdgeInsets.symmetric(
                                  horizontal: 4.w,
                                  vertical: 15.h,
                                ),
                                isDefaultBorder: true,
                                child: pw.Text(
                                  "N°",
                                  style: pw.TextStyle(fontSize: 9.sp),
                                ),
                              ),
                              buildCardValue(
                                width: 49.w,
                                padding: pw.EdgeInsets.symmetric(
                                  horizontal: 4.w,
                                  vertical: 15.h,
                                ),
                                isDefaultBorder: true,
                                child: pw.Text(
                                  "N°",
                                  style: pw.TextStyle(fontSize: 9.sp),
                                ),
                              ),
                            ],
                          ),
                          buildCard(
                            width: 0.5.sw,
                            isDefaultBorder: true,
                            customeBorder: pw.Border.all(color: PdfColors.red),
                            child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              children: [
                                pw.SizedBox(width: 27.w),
                                pw.Text(
                                  "ETAT SPIRITUEL DESEM",
                                  style: pw.TextStyle(
                                    fontSize: 9.sp,
                                    color: PdfColors.red,
                                  ),
                                ),
                                pw.SizedBox(width: 27.w),
                              ],
                            ),
                          ),
                          buildCard(
                            width: 0.2.sw,
                            padding: pw.EdgeInsets.symmetric(
                              horizontal: 31.w,
                              vertical: 108.h,
                            ),
                            isDefaultBorder: true,
                            customeBorder: pw.Border.all(color: PdfColors.red),
                            child: pw.Center(
                              child: pw.Text(
                                "ETAT SPIRITUEL DESEM",
                                style: pw.TextStyle(
                                  fontSize: 9.sp,
                                  color: PdfColors.red,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );

    return pdf.save();
  }

  pw.Widget tableCell(String text, {bool isHeader = false}) {
    return pw.Row(
      children: [
        pw.Padding(
          padding: pw.EdgeInsets.symmetric(
            horizontal: isHeader ? 3.w : 1.w,
            vertical: 3.h,
          ),
          child: pw.Text(
            text,
            style: pw.TextStyle(
              color: isHeader ? PdfColors.black : PdfColors.black,
              fontWeight: isHeader ? pw.FontWeight.bold : pw.FontWeight.normal,
              fontSize: isHeader ? 12.5.sp : 8.8.sp,
            ),
          ),
        ),
      ],
    );
  }
}

pw.Container buildCard({
  required pw.Widget child,
  double? width,
  pw.EdgeInsetsGeometry? padding,
  pw.EdgeInsetsGeometry? margin,
  bool isDefaultBorder = false,
  pw.BoxBorder? customeBorder,
}) {
  return pw.Container(
    padding: padding ?? pw.EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
    margin: margin ?? pw.EdgeInsets.zero,
    decoration: pw.BoxDecoration(
      border: isDefaultBorder
          ? pw.Border.all(color: PdfColors.grey)
          : customeBorder,
    ),
    child: child,
  );
}

pw.Container buildCardValue({
  required pw.Widget child,
  double? width,
  double? height,
  pw.EdgeInsetsGeometry? padding,
  pw.EdgeInsetsGeometry? margin,
  bool isDefaultBorder = false,
  pw.BoxBorder? customeBorder,
}) {
  return pw.Container(
    // height: 50.sh,
    width: width ?? 60.w,
    padding: padding ?? pw.EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
    margin: margin ?? pw.EdgeInsets.zero,
    decoration: pw.BoxDecoration(
      border: isDefaultBorder
          ? pw.Border.all(color: PdfColors.grey)
          : customeBorder,
    ),
    child: child,
  );
}
