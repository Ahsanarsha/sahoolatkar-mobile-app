
// import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;

// class PdfFormView extends StatefulWidget {
//   const PdfFormView({Key? key}) : super(key: key);

//   @override
//   State<PdfFormView> createState() => _PdfFormViewState();
// }

// class _PdfFormViewState extends State<PdfFormView> {
//    final pdf = pw.Document();
//   @override
//   Widget build(BuildContext context) {
//    return Scaffold(
//       appBar: AppBar(title: Text("PDF CREATE"),
//       actions: <Widget>[
//         IconButton(
//           icon: Icon(Icons.save),
//           onPressed: () => savePdfFile(),
//         )
//       ],),
//       body:Container(child:pdf.addPage(pw.Page(
//       pageFormat: PdfPageFormat.a4, 
//       build: (pw.Context context) {
//         return pw.Center(
//           child: pw.Text("Hello Flutter"),
//         );
//       })),) 
//     );
//   }
//   Widget myPDF(){
// re
//   }
// }
