// Automatic FlutterFlow imports
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:typed_data';

Future receiptInvoiceDownload(
  dynamic branchid,
  String title,
  dynamic totaldebit,
  dynamic totalcredit,
  String? name,
  String? pnlno,
  String? addreess,
  String? closingdate,
  String? post,
  String? loanamount,
  String? duedate,
  String? time,
  List<dynamic>? tranid,
  List<dynamic>? trandate,
  List<dynamic>? discription,
  List<dynamic>? debit,
  List<dynamic>? credit,
  List<dynamic>? balance,
) async {
  print("Generating PDF...");

  final pdf = pw.Document(pageMode: PdfPageMode.fullscreen);

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.only(left: 20),
      build: (pw.Context context) {
        List<pw.Widget> widgets = [];

        widgets.add(
          pw.Column(
            children: [
              pw.Center(
                child: pw.Container(
                  margin: pw.EdgeInsets.only(top: 25),
                  child: pw.Column(
                    children: [
                      pw.Text(title,
                          textAlign: pw.TextAlign.right,
                          style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                          )),
                      pw.Text("Branch id-$branchid,Branch VALAPAD MABEN",
                          style: pw.TextStyle(
                            fontSize: 8,
                            fontWeight: pw.FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Container(
                      margin: pw.EdgeInsets.only(top: 25),
                      width: 300,
                      child: pw.Column(children: [
                        pw.Container(
                            alignment: pw.Alignment.centerLeft,
                            height: 10,
                            child: pw.Text(
                                "Customer Name         : " + name.toString(),
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 10,
                                ))),
                        pw.Container(
                            alignment: pw.Alignment.centerLeft,
                            child: pw.Text(
                                "Deposit Date               : " +
                                    closingdate.toString(),
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 10))),
                        pw.Container(
                            alignment: pw.Alignment.centerLeft,
                            child: pw.Text(
                                "Locality                       : " +
                                    post.toString(),
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 10))),
                        pw.Container(
                            alignment: pw.Alignment.centerLeft,
                            child: pw.Text(
                                "Address                          : " +
                                    addreess.toString(),
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 9))),
                      ])),
                  pw.Spacer(),
                  pw.Container(
                      margin: pw.EdgeInsets.only(top: 25),
                      width: 250,
                      child: pw.Column(children: [
                        pw.Container(
                            alignment: pw.Alignment.centerLeft,
                            height: 10,
                            child: pw.Text(
                                "Account No        : " + pnlno.toString(),
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 10,
                                ))),
                        pw.Container(
                            alignment: pw.Alignment.centerLeft,
                            child: pw.Text(
                                "Due Date             : " + duedate.toString(),
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 10))),
                        pw.Container(
                            alignment: pw.Alignment.centerLeft,
                            child: pw.Text(
                                "Amount               : " +
                                    loanamount.toString(),
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 10))),
                        pw.Container(
                            alignment: pw.Alignment.centerLeft,
                            child: pw.Text(
                                "Time                    : " + time.toString(),
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 10))),
                      ])),
                ],
              ),
              pw.Divider(thickness: 2, color: PdfColors.grey),
              pw.Row(
                children: [
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      width: 60,
                      child: pw.Text("TransId",
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 10,
                          ))),
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      width: 100,
                      child: pw.Text("Date",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 10))),
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      width: 220,
                      child: pw.Text("Description",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 10))),
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      width: 70,
                      child: pw.Text("Debit",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 10))),
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      width: 60,
                      child: pw.Text("Credit",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 10))),
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      width: 60,
                      child: pw.Text("Balance",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 10))),
                ],
              ),
              pw.Divider(thickness: 2, color: PdfColors.grey),
            ],
          ),
        );

        List<pw.Widget> transactionRows = [];

        for (int i = 0; i < tranid!.length; i++) {
          DateTime trandateDateTime = DateTime.parse(trandate![i]);
          String formattedDate =
              '${trandateDateTime.day.toString().padLeft(2, '0')}-${trandateDateTime.month.toString().padLeft(2, '0')}-${trandateDateTime.year}';

          // print(formattedDate);
          // String datesplitted =
          //     trandate.toString().split("T").first.replaceAll("[", "");

          transactionRows.add(
            pw.Row(
              children: [
                pw.Container(
                  padding: pw.EdgeInsets.only(top: 10),
                  width: 60,
                  child: pw.Text(
                    tranid[i].toString(),
                    style: pw.TextStyle(fontSize: 7),
                  ),
                ),

                pw.Container(
                  padding: pw.EdgeInsets.only(top: 10),

                  width: 90, // Adjust the width according to your requirement
                  child: pw.Text(
                    formattedDate
                        .toString(), // Assuming trandate is already a list of formatted date strings
                    style: const pw.TextStyle(fontSize: 7),
                  ),
                ),

                pw.Container(
                  padding: pw.EdgeInsets.only(top: 10),

                  width: 240, // Adjust the width according to your requirement
                  child: pw.Text(
                    discription![i].toString(),
                    style: const pw.TextStyle(fontSize: 7),
                  ),
                ),
                pw.Container(
                  padding: pw.EdgeInsets.only(top: 10),

                  width: 40, // Adjust the width according to your requirement
                  child: debit![i] != 0
                      ? pw.Text(
                          debit[i].toString(),
                          style: const pw.TextStyle(fontSize: 7),
                        )
                      : null,
                ),

                pw.SizedBox(width: 25),
                pw.Container(
                  padding: pw.EdgeInsets.only(top: 10),

                  width: 40, // Adjust the width according to your requirement
                  child: credit![i] != 0
                      ? pw.Text(
                          credit[i].toString(),
                          style: const pw.TextStyle(fontSize: 7),
                        )
                      : null,
                ),
                pw.SizedBox(width: 25),
                pw.Container(
                  padding: pw.EdgeInsets.only(top: 10),

                  width: 40, // Adjust the width according to your requirement
                  child: pw.Text(
                    balance![i].toString(),
                    style: const pw.TextStyle(fontSize: 7),
                  ),
                ),
                // pw.Container(
                //   width: 240,
                //   child: pw.Column(
                //     children: [
                //       for (int j = 0; j < discription!.length; j++)
                //         pw.Text(
                //           discription[j],
                //           style: pw.TextStyle(fontSize: 5),
                //         ),
                //     ],
                //   ),
                // ),
              ],
            ),
          );

          // Check if adding another row will exceed the available space
          if ((transactionRows.length + 1) * 20 >=
              PdfPageFormat.a4.availableHeight) {
            widgets.addAll(transactionRows); // Add rows to current page
            transactionRows = []; // Clear the rows for the next page
          }
        }

        // Add remaining rows to the last page
        widgets.addAll(transactionRows);

        widgets.add(
          pw.Row(
            children: [
              pw.Container(
                padding: pw.EdgeInsets.only(top: 10),
                width: 360,
                child: pw.Text(
                  "Total",
                  style: pw.TextStyle(fontSize: 8),
                  textAlign: pw.TextAlign.right,
                ),
              ),
              pw.Container(
                padding: pw.EdgeInsets.only(top: 10),
                width: 60,
                child: pw.Text(
                  totaldebit.toString(),
                  style: pw.TextStyle(fontSize: 8),
                  textAlign: pw.TextAlign.right,
                ),
              ),
              pw.Container(
                padding: pw.EdgeInsets.only(top: 10),
                width: 60,
                child: pw.Text(
                  totalcredit.toString(),
                  style: pw.TextStyle(fontSize: 8),
                  textAlign: pw.TextAlign.right,
                ),
              ),
            ],
          ),
        );

        return widgets;
      },
    ),
  );

  try {
    final Uint8List pdfData = await pdf.save();
    final String? appDocPath = (await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdfData,
      dynamicLayout: true,
    )) as String?;

    if (appDocPath != null) {
      print('PDF Generated');
    } else {
      print('Failed to generate PDF');
    }
  } catch (e) {
    print(e.toString());
  }
}
