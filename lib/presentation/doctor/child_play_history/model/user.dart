import 'package:let_s_have_fun/presentation/admin/users_management/model/user.dart';

class Child extends User {
  String? comments;

  Child(
    {
      required name,
      required email,
      required phone,
      required address,
      required age,
      required level,
      required score,
      required regameCount,
      required gameTime,
      required image,
      required this.comments

    }
  ) : super(name: name , email: email, phone: phone, address:address, age: age, level:level, score: score , regameCount: regameCount, gameTime: gameTime, image:image) ;
}