import 'package:get/get.dart';

class UserController extends GetxController {
  var name = "User Name".obs;
  var email = "user@example.com".obs;
  var avatarPath = "".obs; // Can be local file path or network URL

  // Update user info
  void updateUser({String? newName, String? newEmail, String? newAvatar}) {
    if (newName != null) name.value = newName;
    if (newEmail != null) email.value = newEmail;
    if (newAvatar != null) avatarPath.value = newAvatar;
  }
}
