import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:masters_india/models/gst_model.dart';

class ApiController {
  static const endpoint = 'http://10.0.2.2:3000/gstProfile';

  var client = new http.Client();

  Future<GSTModel> getGSTInfo(String gstNumber) async {
    var response = await client.get(Uri.parse('$endpoint?GSTIN=$gstNumber'));
    print('$endpoint?GSTIN=$gstNumber');
    var parsed = json.decode(response.body);
    return GSTModel.fromJson(parsed[0]);
  }
}
