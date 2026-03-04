import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
void generatePDF(
  BuildContext context, {
  required String name,
  required String whatsapp,
  required String address,
  required String location,
  required String branch,
  required String treatment,
  required String totalAmount,
  required String discountAmount,
  required String advanceAmount,
  required String balanceAmount,
  required String starttime,
  required String endtime,
}) async {
  final pdf = pw.Document();

  // Add your custom page layout here
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Container(
          padding: pw.EdgeInsets.all(20),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Logo
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("KUMARAKOM",
                      style: pw.TextStyle(
                        fontSize: 20,
                        fontWeight: pw.FontWeight.bold,
                      )),
                  pw.Text("Date: ${DateTime.now()}",
                      style: pw.TextStyle(fontSize: 12)),
                ],
              ),
              pw.SizedBox(height: 20),

              // Patient Details
              pw.Text("Patient Details",
                  style: pw.TextStyle(
                      fontSize: 16, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Text("Name: $name"),
              pw.Text("Address: $address"),
              pw.Text("WhatsApp Number: $whatsapp"),

              pw.SizedBox(height: 20),

              // Treatment Details
              pw.Text("Treatment Details",
                  style: pw.TextStyle(
                      fontSize: 16, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Table.fromTextArray(
                headers: ["Treatment", "Price", "Male", "Female", "Total"],
                data: [
                  [treatment, "₹230", "4", "-", "₹2,540"], // Example data
                ],
              ),

              pw.SizedBox(height: 20),

              // Total and Balance
              pw.Text("Total Amount: ₹$totalAmount",
                  style: pw.TextStyle(fontSize: 14)),
              pw.Text("Discount: ₹$discountAmount", style: pw.TextStyle(fontSize: 14)),
              pw.Text("Advance: ₹$advanceAmount", style: pw.TextStyle(fontSize: 14)),
              pw.Text("Balance: ₹$balanceAmount",
                  style: pw.TextStyle(
                      fontSize: 16, fontWeight: pw.FontWeight.bold)),

              pw.SizedBox(height: 30),
              pw.Text(
                "Thank you for choosing us!",
                style: pw.TextStyle(fontSize: 14, color: PdfColors.green),
              ),
            ],
          ),
        );
      },
    ),
  );

  // Save or Share the PDF
  final pdfBytes = await pdf.save();

  // Use the 'printing' package to preview or share
  await Printing.sharePdf(bytes: pdfBytes, filename: 'booking_details.pdf');
}