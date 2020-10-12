import 'package:aplikasi_gaji_pegawai/controllers/pegawai_controller.dart';
import 'package:aplikasi_gaji_pegawai/models/list_pegawai_model.dart';
import 'package:aplikasi_gaji_pegawai/ui/page/add_pegawai.dart';
import 'package:aplikasi_gaji_pegawai/ui/page/update_pegawai.dart';
import 'package:flutter/material.dart';

class ListPegawaiPage extends StatefulWidget {
  @override
  _ListPegawaiPageState createState() => _ListPegawaiPageState();
}

class _ListPegawaiPageState extends State<ListPegawaiPage> {
  ListPegawaiModel listPegawaiModel;

  @override
  void initState() {
    super.initState();
    getPegawai();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context)
              .pushNamed(AddPegawaiPage.routeName)
              .then((value) => getPegawai());
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('List Pegawas '),
      ),
      body: listPegawaiModel == null
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text('loading'),
              ],
            ))
          : RefreshIndicator(
              onRefresh: () => getPegawai(),
              child: ListView.builder(
                itemCount: listPegawaiModel.data.length,
                itemBuilder: (ctx, index) => GestureDetector(
                  onTap: () async {
                    await Navigator.of(context)
                        .push(MaterialPageRoute(
                          builder: (ctx) => UpdatePage(
                            id: '${listPegawaiModel.data[index].id}',
                            gaji:
                                '${listPegawaiModel.data[index].employeeSalary}',
                            umur: '${listPegawaiModel.data[index].employeeAge}',
                            nama:
                                '${listPegawaiModel.data[index].employeeName}',
                          ),
                        ))
                        .then((value) => getPegawai());
                  },
                  child: ListTile(
                    title: Text('${listPegawaiModel.data[index].employeeName}'),
                    subtitle:
                        Text('${listPegawaiModel.data[index].employeeAge}'),
                    trailing:
                        Text('${listPegawaiModel.data[index].employeeSalary}'),
                  ),
                ),
              ),
            ),
    );
  }

  Future<ListPegawaiModel> getPegawai() async {
    PegawaiController().getListPegawai().then((value) {
      setState(() {
        listPegawaiModel = value;
      });
      print(listPegawaiModel.data[0].employeeName);
      return listPegawaiModel;
    });
    return listPegawaiModel;
  }
}
