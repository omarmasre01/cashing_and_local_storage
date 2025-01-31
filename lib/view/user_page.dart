
import 'package:casheing_and_local_storage/model/handle_model.dart';
import 'package:casheing_and_local_storage/model/user_model.dart';
import 'package:casheing_and_local_storage/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// UserService service = UserService(dio: Dio());
class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final serviceProvide = Provider.of<UserProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        serviceProvide.getProfile();
      }),
      appBar: AppBar(),
      body: Consumer<UserProvider>(
        builder: (context, provider, child) {
          if (provider.pureData is UserModel) {
            return Center(
              child: ListTile(
                title: Text(
                  (provider.pureData as UserModel).name,
                ),
                subtitle: Text(
                  (provider.pureData as UserModel).email,
                ),
                trailing: Text(
                  (provider.pureData as UserModel).phone,
                ),
              ),
            );
          } else if (provider.pureData is HandleModel) {
            return Center(
              child: Text((provider.pureData as HandleModel).message),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
