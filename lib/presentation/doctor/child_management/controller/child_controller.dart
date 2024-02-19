import '../../../../core/app_export.dart';
import '../../../admin/users_management/model/user.dart';

class ChildController extends GetxController {
  final RxList<User> users = <User>[].obs;

  @override
  void onInit() {
    // Initialize the list of users (you might fetch it from a data source)
    users.assignAll([
      User(
        name: "اسم المستخدم",
        email: "test1@email.com",
        phone: "053-456-7890",
        address: "الشارع الرئيسي، المدينة",
        age: 28,
        level: 3,
        score: 150,
        regameCount: 7,
        gameTime: Duration(hours: 3, minutes: 30),
        image: "https://example.com/ahmed.jpg",
      ),
      User(
        name: "اسم المستخدم2",
        email: "test2@email.com",
        phone: "057-654-3210",
        address: "شارع النخيل، القرية",
        age: 25,
        level: 2,
        score: 120,
        regameCount: 5,
        gameTime: Duration(hours: 5, minutes: 30),
        image: "https://example.com/fatma.jpg",
      ),
      // Add more users as needed
    ]);

    super.onInit();
  }

  void updateUserProfile(int index, User updatedUser) {
    users[index] = updatedUser;
    // Add logic to save the updated user profile
  }

  void addChild(User child) {
    users.add(child);
    // Add logic to save the new child user
  }
}