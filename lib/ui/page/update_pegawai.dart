import 'package:aplikasi_gaji_pegawai/controllers/pegawai_controller.dart';
import 'package:aplikasi_gaji_pegawai/ui/widgets/template_text_field.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  static const String routeName = '/UpdatePage';
  final String id;
  final String nama;
  final String gaji;
  final String umur;

  const UpdatePage({Key key, this.id, this.nama, this.gaji, this.umur})
      : super(key: key);
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController gajiController = TextEditingController();
  TextEditingController umurController = TextEditingController();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  getdata() {
    setState(() {
      namaController.text = widget.nama;
      gajiController.text = widget.gaji;
      umurController.text = widget.umur;
    });
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Update Pegawai'),
      ),
      body: Column(
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
              PegawaiController()
                  .updatePegawai(
                id: widget.id,
                nama: namaController.text,
                gaji: gajiController.text,
                umur: umurController.text,
              )
                  .then((value) {
                value == true
                    ? Navigator.of(context).pop(true)
                    : _scaffoldKey.currentState.showSnackBar(
                        SnackBar(content: Text('Gagal Update Pegawai')));
              });
            },
            child: Text('Update Pegawai'),
          ),
        ],
      ),
    );
  }
}
