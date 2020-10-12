import 'package:aplikasi_gaji_pegawai/controllers/pegawai_controller.dart';
import 'package:aplikasi_gaji_pegawai/ui/widgets/template_text_field.dart';
import 'package:flutter/material.dart';

class AddPegawaiPage extends StatefulWidget {
  static const routeName = '/addPegawaiPage';
  @override
  _AddPegawaiPageState createState() => _AddPegawaiPageState();
}

class _AddPegawaiPageState extends State<AddPegawaiPage> {
  TextEditingController nama = TextEditingController();
  TextEditingController gaji = TextEditingController();
  TextEditingController umur = TextEditingController();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Add Pegawai'),
      ),
      body: Column(
        children: [
          TemplateTextField(
            textEditingController: nama,
            label: 'Nama',
            icon: Icons.person,
          ),
          TemplateTextField(
            textEditingController: nama,
            label: 'Umur',
            icon: Icons.cake,
          ),
          TemplateTextField(
            textEditingController: nama,
            label: 'Gaji',
            icon: Icons.monetization_on,
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            onPressed: () {
              PegawaiController()
                  .addPegawai(
                nama: nama.text,
                gaji: gaji.text,
                umur: umur.text,
              )
                  .then((value) {
                value == true
                    ? Navigator.of(context).pop()
                    : _scaffoldKey.currentState.showSnackBar(
                        SnackBar(content: Text('Gagal Add Pegawai')));
              });
            },
            child: Text('Add Pegawai'),
          ),
        ],
      ),
    );
  }
}
