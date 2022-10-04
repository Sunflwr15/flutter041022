// ignore_for_file: avoid_print

import 'package:crud/model/model.dart';
import 'package:http/http.dart' as http;

class MuridService {
  String url = "https://app-sekolah.herokuapp.com/api/murid";
  Future getMurid() async {
    Uri urlData = Uri.parse(url);
    final responses = await http.get(urlData);
    if (responses.statusCode == 200) {
      List<DataSiswa> data = dataSiswaFromJson(responses.body.toString());
      print("berhasil");
      return data;
    } else {
      print("gagal");
      return false;
    }
  }
}
