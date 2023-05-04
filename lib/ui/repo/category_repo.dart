import 'package:dio/dio.dart';
import 'package:e_commerce/ui/model/categorry.dart';

class CategoryRepo {
  Future<List<CategoryModel>> getData() async {
    final response = await Dio()
        .get("https://mocki.io/v1/e5775744-06ba-4306-b6f6-93055de3c2d5");

    List<dynamic> responseData = response.data;

    List<CategoryModel> data = responseData.map((jesonDecode) => CategoryModel.fromJson(json: jesonDecode)).toList();


    return data;
  
  }
}
