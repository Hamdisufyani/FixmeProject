import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class CheckOutData {
  Crud crud;
  CheckOutData(this.crud) ;

  checkOut(Map data) async {
    var response = await crud.postData(AppLink.checkOut, data);
    return response.fold((l) => l, (r) => r) ;
  }
}