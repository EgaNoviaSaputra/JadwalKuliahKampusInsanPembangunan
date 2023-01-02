import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';



/// Represents Homepage for Navigation

class pdf1 extends StatefulWidget {
  const pdf1({ Key? key }) : super(key: key);

  @override
  State<pdf1> createState() => _pdf1State();
}

class _pdf1State extends State<pdf1> {
  late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();
  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      actions: <Widget>[
        IconButton(
              onPressed: () {
                _pdfViewerController.zoomLevel = 2.80;
              },
              icon: Icon(
                Icons.zoom_in,
                color: Colors.white,
              )),
              IconButton(
              onPressed: () {
                _pdfViewerController.zoomLevel = 0;
              },
              icon: Icon(
                Icons.arrow_drop_down_circle,
                color: Colors.white,
              )),
      ],
      title: const Text('Jadwal Kuliah Stmik'),
    ),
    body: SfPdfViewer.asset(
      'assets/jadwalStmik.pdf',controller: _pdfViewerController,
    ),
  );
}
}