import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';

class ShariaCompliance extends StatefulWidget {
  const ShariaCompliance({Key? key}) : super(key: key);

  @override
  State<ShariaCompliance> createState() => _ShariaComplianceState();
}

class _ShariaComplianceState extends State<ShariaCompliance> {
  bool _isLoading = true;
  late PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset('assets/pdf/sharia_compliance.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const BackNavigatorWithoutText()),
        backgroundColor: Colors.white,
        title: const Text(
          "Become SaholatKar Merchant",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : PDFViewer(scrollDirection: Axis.vertical, document: document)),
    );
  }
}
