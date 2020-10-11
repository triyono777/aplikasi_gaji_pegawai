import 'package:aplikasi_gaji_pegawai/ui/widgets/template_text_field.dart';
import 'package:flutter/material.dart';

class AddPegawaiPage extends StatefulWidget {
  @override
  _AddPegawaiPageState createState() => _AddPegawaiPageState();
}

class _AddPegawaiPageState extends State<AddPegawaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Pegawai'),
      ),
      body: Column(
        children: [
          TemplateTextField(),
        ],
      ),
    );
  }
}
