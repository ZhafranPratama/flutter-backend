import 'dart:convert';
import 'package:get/get.dart';
import '../model/model.dart';
import 'package:http/http.dart' as http;

class Controller extends GetxController{
  RxBool isloading = false.obs;
  RxList<Biodata> list = RxList<Biodata>([]);

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

  void getData() async{
    try{
      isloading.value = true;
      var response = await http.get(Uri.parse('https://mocki.io/v1/19022094-8f86-445e-b5d9-3e1285a1e7c8'));
      if(response.statusCode==200){
        isloading.value = false;
        final content = jsonDecode(response.body);

        for(Map<String,dynamic> i in content) {
          list.value.add(Biodata.fromJson(i));
        }
      }else{
        isloading.value=false;
        print('error');
      }
  }catch(e){
      print(e.toString());
    }
    }
}