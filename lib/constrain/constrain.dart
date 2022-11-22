import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ur_hub/controllers/app_controller.dart';

import '../controllers/user_controller.dart';

AppController appController = AppController.instance;
UserController userController = UserController.instance;

late GetStorage box;

Color mainColor = const Color(0xFF1F1E2F);
Color secondColor = const Color(0xFF282A3F);
