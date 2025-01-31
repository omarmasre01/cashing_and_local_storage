

import 'package:casheing_and_local_storage/config/service_locater.dart';
import 'package:casheing_and_local_storage/model/user_model.dart';
import 'package:casheing_and_local_storage/view/user_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'provider/user_provider.dart';

void main() async {



  
  WidgetsFlutterBinding.ensureInitialized();


    await Hive.initFlutter(); // This works for both web and non-web

  // Register the adapter for the User class
  Hive.registerAdapter(UserModelAdapter()); // Ensure this matches the generated adapter name
  setup();
  Provider.debugCheckInvalidValueType = null;
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        home: TempPage(),
      ),
    );
  }
}

class TempPage extends StatelessWidget {
  const TempPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserPage(),
            ),
          );
        },
      ),
    );
  }
}
