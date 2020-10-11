import 'dart:convert';

import 'package:aplikasi_gaji_pegawai/models/list_pegawai_model.dart';
import 'package:aplikasi_gaji_pegawai/utils/utils.dart';
import 'package:http/http.dart' as http;

class PegawaiController {
  ListPegawaiModel listPegawaiModel;

  String url = Utils.listPegawai;
  http.Response response;

  Future<ListPegawaiModel> getListPegawai() async {
    response = await http.get(url);

    listPegawaiModel = ListPegawaiModel.fromJson(jsonDecode(response.body));
    print(listPegawaiModel);
    return listPegawaiModel;
  }
}
