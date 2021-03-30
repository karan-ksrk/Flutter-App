import 'package:http/http.dart' as http;
import 'dart:convert';

const url =
    "https://coronavirus-monitor.p.rapidapi.com/coronavirus/worldstat.php";
const header = {
  'x-rapidapi-host': "coronavirus-monitor.p.rapidapi.com",
  'x-rapidapi-key': "29f2b2a22amsh6ba79087545ef2ap1d382bjsn2439fb5c6dea"
};

class WorldData {
  static String total_cases;
  static String total_deaths;
  static String total_recovered;
  static String new_cases;
  static String new_deaths;
  static String stats_time;

  Future updateData() async {
    http.Response response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);

      total_cases = decodeData["total_cases"];
      total_deaths = decodeData["total_deaths"];
      total_recovered = decodeData["total_recovered"];
      new_cases = decodeData["new_cases"];
      new_deaths = decodeData["new_deaths"];
      stats_time = decodeData["statistic_taken_at"];
      print('done Inside');
    } else {
      print(response.statusCode);
    }
  }
}
