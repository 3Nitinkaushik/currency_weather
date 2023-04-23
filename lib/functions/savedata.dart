
import 'package:shared_preferences/shared_preferences.dart';



class data {
  Future<void> load()async{
    final prefs = await SharedPreferences.getInstance();
  }
  void savedata(String dataname){

  }
}