import 'package:aplikasi_gaji_pegawai/controllers/pegawai_controller.dart';
import 'package:aplikasi_gaji_pegawai/ui/widgets/template_text_field.dart';
import 'package:flutter/material.dart';

class AddPegawaiPage extends StatefulWidget {
  static const routeName = '/addPegawaiPage';
  @override
  _AddPegawaiPageState createState() => _AddPegawaiPageState();
}

class _AddPegawaiPageState extends State<AddPegawaiPage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController gajiController = TextEditingController();
  TextEditingController umurController = TextEditingController();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Add Pegawai'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TemplateTextFormField(
              textEditingController: namaController,
              label: 'Nama',
              icon: Icons.person,
            ),
            TemplateTextFormField(
              keyboardType: TextInputType.number,
              textEditingController: umurController,
              label: 'Umur',
              icon: Icons.cake,
            ),
            TemplateTextFormField(
              keyboardType: TextInputType.number,
              textEditingController: gajiController,
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
                if (_formKey.currentState.validate()) {
                  PegawaiController()
                      .addPegawai(
                    nama: namaController.text,
                    gaji: gajiController.text,
                    umur: umurController.text,
                  )
                      .then((value) {
                    value == true
                        ? Navigator.of(context).pop(true)
                        : _scaffoldKey.currentState.showSnackBar(
                            SnackBar(content: Text('Gagal Add Pegawai')));
                  });
                }
              },
              child: Text('Add Pegawai'),
            ),
          ],
        ),
      ),
    );
  }
}
