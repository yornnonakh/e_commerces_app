import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  Rx<User?> firebaseUser = Rx<User?>(null);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  get isLoading => null;

  @override
  void onInit() {
    super.onInit();
    // Bind stream to listen to auth state
    firebaseUser.bindStream(_auth.authStateChanges());
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Success", "Logged in successfully");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<void> signUp(
    String email,
    String password,
    Future<dynamic>? future,
    String trim,
  ) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("Success", "Account created");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
