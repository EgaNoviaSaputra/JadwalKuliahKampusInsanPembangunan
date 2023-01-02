import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:pdfviewers2/pdf.dart';

  
class akutansi1b extends StatelessWidget {
  const akutansi1b({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
 
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
 
  late List jadwal2 = [];

Future<void> initialData() async {
  
    Uri url = Uri.parse(
          "https://http-request-post-default-rtdb.firebaseio.com/akutansi/1/b.json");


    var hasilGetData = await http.get(url);

    var dataResponse = (json.decode(hasilGetData.body) as Map<String, dynamic>);
  //  print(dataResponse['iniselasa']);
    var namaHari = DateFormat().add_EEEE().format(DateTime.now());
 dataResponse.forEach(
      (key, value) {
        
       switch (namaHari) {
      case "Monday": // Senin
    jadwal2 = [
     'Pagi','',dataResponse['senin']['pagi']['1']['mk'],  dataResponse['senin']['pagi']['1']['dosen'],"",
               dataResponse['senin']['pagi']['2']['mk'],dataResponse['senin']['pagi']['2']['dosen'], 
'','','','','','',
        
     'Malam','',dataResponse['senin']['malam']['1']['mk'],dataResponse['senin']['malam']['1']['dosen'] ,'',
                dataResponse['senin']['malam']['2']['mk'],dataResponse['senin']['malam']['2']['dosen']   
      ];
        break;

      case "Tuesday": //Selasa
        jadwal2 = [
          'Pagi','',dataResponse['selasa']['pagi']['1']['mk'],  dataResponse['selasa']['pagi']['1']['dosen'],"",
                   dataResponse['selasa']['pagi']['2']['mk'],dataResponse['selasa']['pagi']['2']['dosen'], 
'','','','','','',
        
     'Malam','',dataResponse['selasa']['malam']['1']['mk'],dataResponse['selasa']['malam']['1']['dosen'] ,'',
                 dataResponse['selasa']['malam']['2']['mk'],dataResponse['selasa']['malam']['2']['dosen']
        ];
        break;

      case "Wednesday": //rabu
        jadwal2 = [
          'Pagi','',dataResponse['rabu']['pagi']['1']['mk'],  dataResponse['rabu']['pagi']['1']['dosen'],"",
                  dataResponse['rabu']['pagi']['2']['mk'],dataResponse['rabu']['pagi']['2']['dosen'], 
'','','','','','',
        
     'Malam','',dataResponse['rabu']['malam']['1']['mk'],dataResponse['rabu']['malam']['1']['dosen'] ,'',
                 dataResponse['rabu']['malam']['2']['mk'],dataResponse['rabu']['malam']['2']['dosen']
        ];
        break;

      case "Thursday": // Kamis
        jadwal2 = [
          
          'Pagi','',dataResponse['kamis']['pagi']['1']['mk'],  dataResponse['kamis']['pagi']['1']['dosen'],"",
                    dataResponse['kamis']['pagi']['2']['mk'],dataResponse['kamis']['pagi']['2']['dosen'], 
'','','','','','',
        
     'Malam','',dataResponse['kamis']['malam']['1']['mk'],dataResponse['kamis']['malam']['1']['dosen'] ,'',
                 dataResponse['kamis']['malam']['2']['mk'],dataResponse['kamis']['malam']['2']['dosen']];
        break;


      case "Friday":// jumat
        jadwal2 = [
          'Pagi','',dataResponse['jumat']['pagi']['1']['mk'],  dataResponse['jumat']['pagi']['1']['dosen'],"",
                  dataResponse['jumat']['pagi']['2']['mk'],dataResponse['jumat']['pagi']['2']['dosen'], 
'','','','','','',
        
     'Malam','',dataResponse['jumat']['malam']['1']['mk'],dataResponse['jumat']['malam']['1']['dosen'] ,'',
                 dataResponse['jumat']['malam']['2']['mk'],dataResponse['jumat']['malam']['2']['dosen']
        ];
        break;
        
        case "Saturday": //sabtu
        jadwal2 = [
          'Pagi','',dataResponse['sabtu']['pagi']['1']['mk'],  dataResponse['sabtu']['pagi']['1']['dosen'],"",
                   dataResponse['sabtu']['pagi']['2']['mk'],dataResponse['sabtu']['pagi']['2']['dosen'], 
'','','','','','',
        
     'Malam','',dataResponse['sabtu']['malam']['1']['mk'],dataResponse['sabtu']['malam']['1']['dosen'] ,'',
                 dataResponse['sabtu']['malam']['2']['mk'],dataResponse['sabtu']['malam']['2']['dosen']
        ];
        break;


      case "Sunday": 
        jadwal2 = [
          'Pagi','',dataResponse['minggu']['pagi']['1']['mk'],  dataResponse['minggu']['pagi']['1']['dosen'],"",
                   dataResponse['minggu']['pagi']['2']['mk'],dataResponse['minggu']['pagi']['2']['dosen'], 
'','','','','','',
        
     'Malam','',dataResponse['minggu']['malam']['1']['mk'],dataResponse['minggu']['malam']['1']['dosen'] ,'',
                 dataResponse['minggu']['malam']['2']['mk'],dataResponse['minggu']['malam']['2']['dosen']
        ];
        break;

      default:
        jadwal2 = [];
        break;
    }

      },
    );
    print("BERHASIL MASUKAN DATA LIST");

  //  notifyListeners();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JADWAL HARI INI"),
      ),
      body: FutureBuilder(
        future: initialData(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
 
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: jadwal2
                  .map(
                    (e) => Text(
                      e.toString(),
                      style: TextStyle(
                        fontSize: 18,fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),floatingActionButton: FloatingActionButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>pdf1()));},child: Icon(Icons.note),)
    );
  }
}