import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grace_church/feature/home/page/cellule/rapport_cellule_pdf_view.dart';
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
                    margin: pw.EdgeInsets.only(top: 15.h),
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
                    margin: pw.EdgeInsets.only(top: 7.h, bottom: 14.h),
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

                pw.SizedBox(height: 5.h),
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

                pw.SizedBox(height: 20.h),

                // EFFECTIF SECTION
                pw.Row(
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        
                      buildCard(
                          padding: pw.EdgeInsets.symmetric(
                            horizontal: 37.6.w,
                            vertical: 5.h,
                          ),
                          isDefaultBorder: false,
                          customeBorder: pw.Border(
                            top: pw.BorderSide(color: PdfColors.black),
                            right: pw.BorderSide(color: PdfColors.grey),
                            left: pw.BorderSide(color: PdfColors.grey),
                          ),
                          child: pw.Row(
                            children: [pw.Text("EFFECTIF"), pw.SizedBox(width: 1.w)],
                        ),
                      ),
                        pw.Row(
                          children: [
                            buildCard(
                              padding: pw.EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 5.h,
                              ),
                              isDefaultBorder: true,
                              customeBorder: pw.Border(
                                top: pw.BorderSide(color: PdfColors.black),
                              ),
                              child: pw.Row(children: [pw.Text("Chrét.Bapt")]),
                            ),
                            buildCardValue(
                              padding: pw.EdgeInsets.symmetric(
                                horizontal: 6.9.w,
                                vertical: 5.h,
                              ),
                              isDefaultBorder: true,
                              customeBorder: pw.Border(
                                top: pw.BorderSide(color: PdfColors.black),
                              ),
                              child: pw.Row(children: [pw.Text("01")]),
                            ),
                          ],
                        ),
                        pw.Row(
                          children: [
                            buildCard(
                              padding: pw.EdgeInsets.symmetric(
                                horizontal: 4.w,
                                vertical: 5.h,
                              ),
                              isDefaultBorder: true,
                              customeBorder: pw.Border(
                                top: pw.BorderSide(color: PdfColors.black),
                              ),
                              child: pw.Row(children: [pw.Text("Chré.N.Bapt")]),
                            ),
                            buildCardValue(
                              padding: pw.EdgeInsets.symmetric(
                                horizontal: 6.9.w,
                                vertical: 5.h,
                              ),
                              isDefaultBorder: true,
                              customeBorder: pw.Border(
                                top: pw.BorderSide(color: PdfColors.black),
                              ),
                              child: pw.Row(children: [pw.Text("01")]),
                            ),
                          ],
                        ),
                         pw.Row(
                          children: [
                            buildCard(
                              padding: pw.EdgeInsets.symmetric(
                                horizontal: 22.4.w,
                                vertical: 5.h,
                              ),
                              isDefaultBorder: true,
                              customeBorder: pw.Border(
                                top: pw.BorderSide(color: PdfColors.black),
                              ),
                              child: pw.Row(
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                children: [pw.Text("Total")],
                              ),
                            ),
                            buildCardValue(
                              padding: pw.EdgeInsets.symmetric(
                                horizontal: 4.w,
                                vertical: 5.h,
                              ),
                              isDefaultBorder: true,
                              customeBorder: pw.Border(
                                top: pw.BorderSide(color: PdfColors.black),
                              ),
                              child: pw.Row(children: [pw.Text("201")]),
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
                            horizontal: 64.w,
                            vertical: 5.h,
                          ),
                          isDefaultBorder: false,
                          customeBorder: pw.Border(
                            top: pw.BorderSide(
                              color: PdfColors.black,
                              style: pw.BorderStyle.solid,
                            ),
                            right: pw.BorderSide(
                              color: PdfColors.black,
                              style: pw.BorderStyle.solid,
                            ),
                          ),
                          child: pw.Column(
                            children: [
                              pw.Row(children: [pw.Text("EGLISE DE MAISON")]),
                              pw.SizedBox(height: 21.h),
                            ],
                          ),
                        ),
                       pw.Row(
                        children: [
                          buildCard(
                          padding: pw.EdgeInsets.symmetric(
                            horizontal: 4.w,
                            vertical: 6.h,
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
                              pw.Row(children: [pw.Text("CETTE\nSEMAINE")]),
                              pw.SizedBox(height: 8.h),
                            ],
                          ),
                        ),
                         buildCard(
                          padding: pw.EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 10.5.h,
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
                              pw.Row(children: [pw.Text("T ")]),
                              pw.SizedBox(height: 11.h),
                            ],
                          ),
                        ),
                           buildCard(
                          padding: pw.EdgeInsets.symmetric(
                            horizontal: 4.w,
                            vertical: 6.h,
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
                              pw.Row(children: [pw.Text("SEMAINE\nPASSEE")]),
                              pw.SizedBox(height: 8.h),
                            ],
                          ),
                        ),

                         buildCard(
                          padding: pw.EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 10.5.h,
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
                              pw.Row(children: [pw.Text("T ")]),
                              pw.SizedBox(height: 11.h),
                            ],
                          ),
                        ),

                         buildCard(
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
                              pw.Row(children: [pw.Text("ECART")]),
                              pw.SizedBox(height: 8.h),
                            ],
                          ),
                        ),







                       ],),
                       

                      ]
                    )
                  ],
                ),
                // SUB EFFECTIF SECTION
                pw.Row(
                  children: [
                    pw.Container(
                      height: 0.27.sh,
                      alignment: pw.Alignment.center,
                     padding: pw.EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 10.h,
                     ),
                     decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black),
                     ),
                     child:pw.Transform.rotateBox(angle: 1.57, child: pw.Text("ASSISTANCE")),
                    ),
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                     pw.Row(
                      children: [
                        buildCard(
                          padding: pw. EdgeInsets.symmetric(horizontal: 5.9.w, vertical: 5.h),
                          isDefaultBorder: false,
                          customeBorder: pw.Border(
                            bottom: pw.BorderSide(
                              color: PdfColors.black,
                              style: pw.BorderStyle.solid,
                            ),
                          ),
                          child: pw.Text("Chrétiens baptisés")),
                         buildCardValue(
                          width: 58.w,
                              padding: pw.EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.3.h),
                              isDefaultBorder: true,
                              customeBorder: pw.Border.all(color: PdfColors.black),
                              child: pw.Text("00")),
                          buildCardValue(
                          width: 30.5.w,
                              padding: pw.EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.3.h),
                              isDefaultBorder: true,
                              customeBorder: pw.Border.all(color: PdfColors.black),
                              child: pw.Text("00")),
                             buildCardValue(
                          width: 59.w,
                              padding: pw.EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.3.h),
                              isDefaultBorder: true,
                              customeBorder: pw.Border.all(color: PdfColors.black),
                              child: pw.Text("00")),
                                 buildCardValue(
                          width: 30.w,
                              padding: pw.EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.3.h),
                              isDefaultBorder: true,
                              customeBorder: pw.Border.all(color: PdfColors.black),
                              child: pw.Text("00")), 
                              buildCardValue(
                          width: 58.3.w,
                              padding: pw.EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.3.h),
                              isDefaultBorder: true,
                              customeBorder: pw.Border.all(color: PdfColors.black),
                              child: pw.Text("00")),      
                      ],
                     ),
                        pw.Row(
                          children: [
                            buildCard(
                              padding: pw.EdgeInsets.symmetric(horizontal: 5.3.w, vertical: 5.h),
                              isDefaultBorder: false,
                              customeBorder: pw.Border.all(color: PdfColors.black),
                              child: pw.Text("Chrétiens\nNon\nbaptisés")),
                              pw.Column(
                                children: [
                                  pw.Row(
                                    children: [
                                      buildCardValue(
                                        width: 65.w,
                                        padding: pw.EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.3.h),
                                        isDefaultBorder: true,
                                        customeBorder: pw.Border.all(color: PdfColors.black),
                                        child:  pw.Text("Tout-petits")
                                      ),
                                      buildCardValue(
                                        width: 58.3.w,
                                        padding: pw.EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.3.h),
                                        isDefaultBorder: true,
                                        customeBorder: pw.Border.all(color: PdfColors.black),
                                        child: pw.Text("00")
                                      ),
                                    ],
                                  ),
                                   pw.Row(
                                    children: [
                                      buildCardValue(
                                        width: 65.w,
                                        padding: pw.EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.3.h),
                                        isDefaultBorder: true,
                                        customeBorder: pw.Border.all(color: PdfColors.black),
                                        child:  pw.Text("cadets")
                                      ),
                                      buildCardValue(
                                        width: 58.3.w,
                                        padding: pw.EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.3.h),
                                        isDefaultBorder: true,
                                        customeBorder: pw.Border.all(color: PdfColors.black),
                                        child: pw.Text("00")
                                      ),
                                    ],
                                  )
                                  
                                ],
                              )

                          ],
                        ),
                         pw.Row(
                          children: [
                            buildCard(
                              padding: pw.EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 10.h),
                              isDefaultBorder: false,
                              customeBorder: pw.Border.all(color: PdfColors.black),
                              child: pw.Text("Nouveaux")),
                              
                          ],
                        ),
                         pw.Row(
                          children: [
                            buildCard(
                              padding: pw.EdgeInsets.symmetric(horizontal: 13.w, vertical: 12.h),
                              isDefaultBorder: false,
                              customeBorder: pw.Border.all(color: PdfColors.black),
                              child: pw.Text("Invités")),
                              
                          ],
                        )
                      ],
                    ),

                    

                    
                  ],
                )
              
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
  pw.EdgeInsetsGeometry? padding,
  pw.EdgeInsetsGeometry? margin,
  bool isDefaultBorder = false,
  pw.BoxBorder? customeBorder,
}) {
  return pw.Container(
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





  //  pw.Row(
  //                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   pw.Column(
  //                     crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                     children: [
  //                       pw.Text(
  //                         "ASSISTANCE ET DONNEES STATISTIQUES",
  //                         style: pw.TextStyle(
  //                           fontSize: 18,
  //                           fontWeight: pw.FontWeight.bold,
  //                           color: PdfColors.red,
  //                         ),
  //                       ),
  //                       pw.Container(
  //                         // width: 16.w,
  //                         padding: pw.EdgeInsets.symmetric(
  //                           horizontal: 9.w,
  //                           vertical: 2,
  //                         ),
  //                         alignment: pw.Alignment.center,
  //                         decoration: pw.BoxDecoration(
  //                           border: pw.Border.all(color: PdfColors.black),
  //                         ),
  //                         child: pw.Text("EFFECTIF"),
  //                       ),
  //                       pw.Table(
  //                         border: pw.TableBorder.all(color: PdfColors.grey300),
  //                         children: [
  //                           pw.TableRow(
  //                             children: [
  //                               tableCell("Chrét.Bapt"), //<< LGINE 1
  //                               pw.Padding(
  //                                 padding: pw.EdgeInsets.symmetric(
  //                                   horizontal: 3.w,
  //                                   vertical: 3.h,
  //                                 ),
  //                                 child: pw.Text(
  //                                   int.parse(rapportCellule.nombreBaptiser) > 9
  //                                       ? "${rapportCellule.nombreBaptiser}"
  //                                       : "0${rapportCellule.nombreBaptiser}",
  //                                   style: pw.TextStyle(
  //                                     color: PdfColors.black,
  //                                     fontWeight: pw.FontWeight.bold,
  //                                     fontSize: 12.5.sp,
  //                                   ),
  //                                 ),
  //                               ), //<< LGINE 1
  //                             ],
  //                           ),
  //                           pw.TableRow(
  //                             children: [
  //                               tableCell("Chré.N.Bapt "), //<< LGINE 1
  //                               pw.Padding(
  //                                 padding: pw.EdgeInsets.symmetric(
  //                                   horizontal: 3.w,
  //                                   vertical: 3.h,
  //                                 ),
  //                                 child: pw.Text(
  //                                   int.parse(
  //                                             rapportCellule.nombreNonBaptiser,
  //                                           ) >
  //                                           9
  //                                       ? "${rapportCellule.nombreNonBaptiser}"
  //                                       : "0${rapportCellule.nombreNonBaptiser}",
  //                                   style: pw.TextStyle(
  //                                     color: PdfColors.black,
  //                                     fontWeight: pw.FontWeight.bold,
  //                                     fontSize: 12.5.sp,
  //                                   ),
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                           pw.TableRow(
  //                             children: [
  //                               tableCell("TOTAL"), //<< LGINE 2
  //                               pw.Padding(
  //                                 padding: pw.EdgeInsets.symmetric(
  //                                   horizontal: 3.w,
  //                                   vertical: 3.h,
  //                                 ),
  //                                 child: pw.Text(
  //                                   "${int.parse(rapportCellule.nombreBaptiser) + int.parse(rapportCellule.nombreNonBaptiser)}",
  //                                   style: pw.TextStyle(
  //                                     color: PdfColors.black,
  //                                     fontWeight: pw.FontWeight.bold,
  //                                     fontSize: 12.5.sp,
  //                                   ),
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ],
  //                       ),
  //                       pw.Row(
  //                         children: [
  //                           pw.Column(
  //                             crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                             children: [
  //                               pw.Container(
  //                                 height: 100.h,
  //                                 alignment: pw.Alignment.center,
  //                                 padding: pw.EdgeInsets.symmetric(
  //                                   horizontal: 3.w,
  //                                   vertical: 3.h,
  //                                 ),
  //                                 decoration: pw.BoxDecoration(
  //                                   border: pw.Border.all(
  //                                     color: PdfColors.black,
  //                                   ),
  //                                 ),
  //                                 child: pw.Transform.rotateBox(
  //                                   angle: 1.57,
  //                                   child: pw.Text(
  //                                     "sdsdfsdf",
  //                                     style: pw.TextStyle(
  //                                       fontSize: 18,
  //                                       fontWeight: pw.FontWeight.bold,
  //                                       color: PdfColors.red,
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                          pw.Column(
  //                           crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                           children: [
  //                            pw.Container(
  //                             height: 100.h,
  //                             padding: pw.EdgeInsets.symmetric(
  //                               // horizontal: 9.w,
  //                               // vertical: 2,
  //                             ),
  //                             alignment: pw.Alignment.topCenter,
  //                             decoration: pw.BoxDecoration(
  //                               border: pw.Border.all(color: PdfColors.black),
  //                             ),
  //                             child:pw.Column(
  //                               children: [
  //                                 pw.Container(
  //                                   padding: pw.EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
  //                                   decoration: pw.BoxDecoration(
  //                                     border: pw.Border(
  //                                       bottom: pw.BorderSide(color: PdfColors.black),
  //                                     ),
  //                                   ),
  //                                   child: pw.Text("Chrétiens baptisés"),
  //                                 ),
  //                                 pw.Row(
  //                                   children: [
  //                                     pw.Column(
  //                                       children: [
  //                                        pw.Padding(padding: pw.EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),child: pw.Text("Chrétiens\nNon\nbaptisés"),)
  //                                       ],
  //                                     ),
  //                                       pw.Table(
  //                         border: pw.TableBorder.all(color: PdfColors.grey300),
  //                         children: [
  //                           pw.TableRow(
  //                             children: [
  //                               tableCell("Chrét.Bapt"), //<< LGINE 1
  //                               pw.Padding(
  //                                 padding: pw.EdgeInsets.symmetric(
  //                                   horizontal: 3.w,
  //                                   vertical: 3.h,
  //                                 ),
  //                                 child: pw.Text(
  //                                   int.parse(rapportCellule.nombreBaptiser) > 9
  //                                       ? "${rapportCellule.nombreBaptiser}"
  //                                       : "0${rapportCellule.nombreBaptiser}",
  //                                   style: pw.TextStyle(
  //                                     color: PdfColors.black,
  //                                     fontWeight: pw.FontWeight.bold,
  //                                     fontSize: 12.5.sp,
  //                                   ),
  //                                 ),
  //                               ), //<< LGINE 1
  //                             ],
  //                           ),
  //                           pw.TableRow(
  //                             children: [
  //                               tableCell("Chré.N.Bapt "), //<< LGINE 1
  //                               pw.Padding(
  //                                 padding: pw.EdgeInsets.symmetric(
  //                                   horizontal: 3.w,
  //                                   vertical: 3.h,
  //                                 ),
  //                                 child: pw.Text(
  //                                   int.parse(
  //                                             rapportCellule.nombreNonBaptiser,
  //                                           ) >
  //                                           9
  //                                       ? "${rapportCellule.nombreNonBaptiser}"
  //                                       : "0${rapportCellule.nombreNonBaptiser}",
  //                                   style: pw.TextStyle(
  //                                     color: PdfColors.black,
  //                                     fontWeight: pw.FontWeight.bold,
  //                                     fontSize: 12.5.sp,
  //                                   ),
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                           pw.TableRow(
  //                             children: [
  //                               tableCell("TOTAL"), //<< LGINE 2
  //                               pw.Padding(
  //                                 padding: pw.EdgeInsets.symmetric(
  //                                   horizontal: 3.w,
  //                                   vertical: 3.h,
  //                                 ),
  //                                 child: pw.Text(
  //                                   "${int.parse(rapportCellule.nombreBaptiser) + int.parse(rapportCellule.nombreNonBaptiser)}",
  //                                   style: pw.TextStyle(
  //                                     color: PdfColors.black,
  //                                     fontWeight: pw.FontWeight.bold,
  //                                     fontSize: 12.5.sp,
  //                                   ),
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ],
  //                       ),
                      

                                    
  //                                   ],
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           ]
  //                          )
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
            