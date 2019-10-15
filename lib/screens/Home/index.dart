import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({ Key key }) : super(key: key);
  HomeScreen();

  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   return new Scaffold(body:new Center(child: new Text("Home"),));
  // }

  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> formData;
  // divisi fungsi
  List<String> divisi = [
    'Divisi Enterprise Service',
    'Divisi Business Service',
    'Divisi Governent Service',
  ];
  // witel
  List<String> witel = [
    'Balikpapan',
    'Samarinda',
    'Kalimantan Tengah',
    'Kalimantan Barat',
    'Kalimantan Utara',
    'Kalimantan Selatan',
  ];
  // jenis layanan
  List<String> layanan = [
    'Pasang Baru',
    'Perpanjangan',
    'Amandemen',
  ];
  // jenis product
  List<String> produk = [
    'Connectivity Only',
    'Bundliing Connectivity dan CPE',
    'CPE only',
  ];
  // nilai kontrak
  List<String> nilai_kontrak = [
    '< 250 juta',
    '250 juta - 1 M',
    '> 1 M',
  ];

  HomeScreenState() {
    formData = {
      'divisi': 'Divisi Enterprise Service',
      'witel': 'Balikpapan',
      'layanan': 'Pasang Baru',
      'produk': 'Connectivity Only',
      'nilai_kontrak': '< 250 juta',
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: buildFutures(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            default:
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                if (snapshot.data != null)
                  return Scaffold(
                      appBar: AppBar(
                        titleSpacing: 5.0,
                        title: Text(
                          'Pengkolan',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        actions: <Widget>[
                          Builder(
                            builder: (BuildContext context) {
                              return IconButton(
                                  icon: const Icon(Icons.check),
                                  iconSize: 20.0,
                                  tooltip: 'Save',
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                      _formKey.currentState.save();
                                      showDialog<String>(
                                          context: context,
                                          builder:
                                              (BuildContext dialogContext) =>
                                                  AlertDialog(
                                                    content: Text(
                                                        'Data submitted is \n${formData.toString()}'),
                                                  ));
                                    }
                                  });
                            },
                          )
                        ],
                      ),
                      body: Container(
                        color: Colors.white,
                        constraints: BoxConstraints.expand(),
                        child: Form(
                            key: _formKey,
                            autovalidate: false,
                            child: SingleChildScrollView(
                                child: Column(
                              children: <Widget>[
                                Divider(
                                    height: 10.0,
                                    color: Theme.of(context).primaryColor),
                                DropDownField(
                                    value: formData['divisi'],
                                    icon: Icon(Icons.people),
                                    required: true,
                                    hintText: 'Pilih divisi ...',
                                    labelText: 'Divisi Fungsi',
                                    items: divisi,
                                    strict: false,
                                    setter: (dynamic newValue) {
                                      formData['divisi'] = newValue;
                                    }),
                                Divider(
                                    height: 10.0,
                                    color: Theme.of(context).primaryColor),
                                DropDownField(
                                    value: formData['witel'],
                                    icon: Icon(Icons.location_on),
                                    required: true,
                                    hintText: 'Pilih witel ...',
                                    labelText: 'Witel',
                                    items: witel,
                                    strict: false,
                                    setter: (dynamic newValue) {
                                      formData['witel'] = newValue;
                                    }),
                                Divider(
                                    height: 10.0,
                                    color: Theme.of(context).primaryColor),
                                DropDownField(
                                    value: formData['layanan'],
                                    icon: Icon(Icons.room_service),
                                    required: true,
                                    hintText: 'Pilih jenis layanan ...',
                                    labelText: 'Jenis Layanan',
                                    items: layanan,
                                    strict: false,
                                    setter: (dynamic newValue) {
                                      formData['layanan'] = newValue;
                                    }),
                                Divider(
                                    height: 10.0,
                                    color: Theme.of(context).primaryColor),
                                DropDownField(
                                    value: formData['produk'],
                                    icon: Icon(Icons.computer),
                                    required: true,
                                    hintText: 'Pilih jenis product ...',
                                    labelText: 'Jenis Product',
                                    items: produk,
                                    strict: false,
                                    setter: (dynamic newValue) {
                                      formData['produk'] = newValue;
                                    }),
                                Divider(
                                    height: 10.0,
                                    color: Theme.of(context).primaryColor),
                                DropDownField(
                                    value: formData['nilai_kontrak'],
                                    icon: Icon(Icons.monetization_on),
                                    required: false,
                                    hintText: 'pilih nilai kontrak ...',
                                    labelText: 'Nilai Kontrak',
                                    items: nilai_kontrak,
                                    setter: (dynamic newValue) {
                                      formData['nilai_kontrak'] = newValue;
                                    }),
                              ],
                            ))),
                      ));
                else
                  return LinearProgressIndicator();
              }
          }
        });
  }

  Future<bool> buildFutures() async {
    return true;
  }
  
}