import 'dart:convert';
import 'package:get/get.dart';
import '../model/dataModel.dart';
import 'package:http/http.dart' as http;

class dataController extends GetxController{
  RxBool isloading = false.obs;
  RxList<Datas> datas = RxList<Datas>([]);
  RxList<Posts> posts = RxList<Posts>([]);

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

  void getData() async{
    try{
      isloading.value = true;
      var response = await http.get(Uri.parse('https://mocki.io/v1/0ac286fe-6786-4415-a2bd-85d6441e89ff'));
      if(response.statusCode==200){
        isloading.value = false;
        final content = jsonDecode(response.body);

        for(Map<String,dynamic> i in content) {
          datas.value.add(Datas.fromJson(i));
        }
      }else{
        isloading.value=false;
        print('error');
      }
    }catch(e){
      print(e.toString());
    }
  }

  RxInt id = 0.obs;

  void getPost(int ids) async{
    id.value = ids;
  }
}