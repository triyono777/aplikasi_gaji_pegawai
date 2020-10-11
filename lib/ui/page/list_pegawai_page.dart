import 'package:aplikasi_gaji_pegawai/controllers/pegawai_controller.dart';
import 'package:aplikasi_gaji_pegawai/models/list_pegawai_model.dart';
import 'package:flutter/material.dart';

class ListPegawaiPage extends StatefulWidget {
  @override
  _ListPegawaiPageState createState() => _ListPegawaiPageState();
}

class _ListPegawaiPageState extends State<ListPegawaiPage> {
  ListPegawaiModel listPegawaiModel;
  getPegawai() {
    PegawaiController().getListPegawai().then((value) {
      setState(() {
        listPegawaiModel = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getPegawai();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Pegawai'),
      ),
      body: FutureBuilder(
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(child: Text('loading'))
            : ListView.builder(
                itemCount: listPegawaiModel.data.length,
                itemBuilder: (ctx, index) => ListTile(
                  title: Text('${listPegawaiModel.data[index].employeeName}'),
                  subtitle: Text('${listPegawaiModel.data[index].employeeAge}'),
                  trailing:
                      Text('${listPegawaiModel.data[index].employeeSalary}'),
                ),
              ),
      ),
    );
  }
}
