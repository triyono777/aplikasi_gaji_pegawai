import 'dart:convert';

import 'package:aplikasi_gaji_pegawai/models/list_pegawai_model.dart';
import 'package:aplikasi_gaji_pegawai/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PegawaiController {
  ListPegawaiModel listPegawaiModel;

  http.Response response;

  Future<ListPegawaiModel> getListPegawai() async {
    String url = Utils.listPegawai;
    response = await http.get(url);

    listPegawaiModel = ListPegawaiModel.fromJson(jsonDecode(response.body));
    print(listPegawaiModel.data[0].employeeName);
    return listPegawaiModel;
  }

  Future<bool> addPegawai({
    @required String nama,
    @required String gaji,
    @required String umur,
  }) async {
    String url = Utils.addPegawai;
    response = await http.post(url, body: {
      'employee_name': nama,
      'employee_salary': gaji,
      'employee_age': umur
    });

    final hasil = jsonDecode(response.body);
    print(hasil);
    if (hasil['status'] == 'success') {
      return true;
    }

    return false;
  }

  Future<bool> updatePegawai({
    @required String nama,
    @required String gaji,
    @required String umur,
    @required String id,
  }) async {
    String url = Utils.updatePegawai;
    response = await http.post(url, body: {
      'id': id,
      'employee_name': nama,
      'employee_salary': gaji,
      'employee_age': umur
    });

    final hasil = jsonDecode(response.body);
    print(hasil);
    if (hasil['status'] == 'success') {
      return true;
    }

    return false;
  }

  Future<bool> deletePegawai({@required String id}) async {
    String url = Utils.deletePegawai;
    response = await http.get(url + '?id=$id');

    return true;
  }
}
