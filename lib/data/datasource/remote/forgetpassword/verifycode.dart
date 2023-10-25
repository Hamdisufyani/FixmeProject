
import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class VerifyCodeResetPasswordData {
  Crud crud;
  VerifyCodeResetPasswordData(this.crud);

  postData(String email,String verifyCode) async {
    var response = await crud.postData(AppLink.verifyCodeResetPassword, {
      "email": email,
      "verifycode": verifyCode,

    });
    return response.fold((l) => l, (r) => r);
  }
}
