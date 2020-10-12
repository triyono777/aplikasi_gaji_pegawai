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
        title: Text('List Pegawas'),
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
                  child: Dismissible(
                    key: UniqueKey(),
                    direction:
                        DismissDirection.endToStart, //ATUR ARAH DISMISSNYA
                    //BUAT KONFIRMASI KETIKA USER INGIN MENGHAPUS DATA
                    confirmDismiss: (DismissDirection direction) async {
                      //TAMPILKAN DIALOG KONFIRMASI
                      final bool res = await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            //DENGAN MENGGUNAKAN ALERT DIALOG
                            return AlertDialog(
                              title: Text('Konfirmasi'),
                              content: Text('Kamu Yakin?'),
                              actions: <Widget>[
                                //KITA SET DUA BUAH TOMBOL UNTUK HAPUS DAN CANCEL DENGAN VALUE BOOLEAN
                                FlatButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: Text('HAPUS'),
                                ),
                                FlatButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: Text('BATALKAN'),
                                )
                              ],
                            );
                          });
                      return res;
                    },
                    onDismissed: (value) {
                      //
                      PegawaiController()
                          .deletePegawai(id: listPegawaiModel.data[index].id)
                          .then((value) => getPegawai());
                    },
                    background: Container(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: Card(
                        child: ListTile(
                          title: Text(
                              'Nama: ${listPegawaiModel.data[index].employeeName}'),
                          subtitle: Text(
                              'Umur: ${listPegawaiModel.data[index].employeeAge}'),
                          trailing: Text(
                              'Rp ${listPegawaiModel.data[index].employeeSalary}'),
                        ),
                      ),
                    ),
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
