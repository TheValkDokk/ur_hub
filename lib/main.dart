import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ur_hub/constrain/constrain.dart';
import 'package:window_size/window_size.dart';

import 'controllers/app_controller.dart';
import 'controllers/user_controller.dart';
import 'models/user_settings.dart';
import 'panels/selected_panel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  box = GetStorage();

  await dotenv.load();
  Get.put(AppController());
  Get.put(UserController());

  ever(
    appController.userSettings,
    (callback) {
      appController.haveSteamUser.value = true;
      box.write('user-settings', callback.toMap());
    },
  );
  try {
    var userMap = box.read('user-settings');
    if (userMap == null) {
      box.write('user-settings', appController.userSettings.value.toMap());
    } else {
      appController.userSettings = UserSettings.fromMap(userMap).obs;
      appController.haveSteamUser.value = true;
    }
  } catch (e) {
    //box.write('user-settings', appController.userSettings.value.toMap());
  }

//
  runApp(const MyApp());
//
  final screen = await getCurrentScreen();

  doWhenWindowReady(() {
    final win = appWindow;
    var initialSize = Size(screen!.frame.width, screen.frame.height);
    win.minSize = const Size(1280, 720);
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Your Hub";
    win.show();
    win.maximize();
  });
}

const borderColor = Colors.purple;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WindowBorder(
          color: borderColor,
          width: 1,
          child: Obx(
            () => appController.appInit.value
                ? Row(
                    children: const [NavSideBar(), MainPanel()],
                  )
                : Container(
                    color: Colors.transparent,
                    child: const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class NavSideBar extends StatefulWidget {
  const NavSideBar({Key? key}) : super(key: key);

  @override
  State<NavSideBar> createState() => _NavSideBarState();
}

class _NavSideBarState extends State<NavSideBar> {
  bool navExtend = false;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Center(
          child: Obx(() => Container(
                color: appController.userSettings.value.secondColor,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        color: appController.userSettings.value.secondColor,
                        child: navExtend
                            ? IconButton(
                                onPressed: () => setState(() {
                                  navExtend = !navExtend;
                                }),
                                icon: const Icon(
                                  CupertinoIcons.arrow_left_to_line,
                                  color: Colors.white,
                                ),
                              )
                            : IconButton(
                                onPressed: () => setState(() {
                                  navExtend = !navExtend;
                                }),
                                icon: const Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                    Expanded(
                      child: NavigationRail(
                        minExtendedWidth: 150,
                        backgroundColor:
                            appController.userSettings.value.secondColor,
                        destinations: appController.railDestinationList,
                        onDestinationSelected: (value) =>
                            appController.selectedIndex.value = value,
                        selectedIndex: appController.selectedIndex.value,
                        groupAlignment: 0,
                        unselectedLabelTextStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        extended: navExtend,
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          //Save
                          appController.getDetail();
                        },
                        icon: const Icon(Icons.local_dining)),
                    IconButton(
                        onPressed: () async {},
                        icon: const Icon(Icons.access_time_filled))
                  ],
                ),
              )),
        );
      },
    );
  }
}

const backgroundStartColor = Color.fromARGB(255, 31, 30, 47);

class MainPanel extends StatelessWidget {
  const MainPanel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    mainColor = appController.userSettings.value.mainColor;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: mainColor,
        ),
        child: Column(children: [
          WindowTitleBarBox(
            child: Row(
              children: [Expanded(child: MoveWindow()), const WindowButtons()],
            ),
          ),
          const Expanded(child: SelectedPanel())
        ]),
      ),
    );
  }
}

final buttonColors = WindowButtonColors(
  iconNormal: Colors.white,
  mouseOver: Colors.white,
  mouseDown: const Color(0xFF805306),
  iconMouseOver: Colors.blue,
);

final closeButtonColors = WindowButtonColors(
  mouseOver: const Color(0xFFD32F2F),
  mouseDown: const Color(0xFFB71C1C),
  iconNormal: Colors.white,
  iconMouseOver: Colors.white,
);

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(
          colors: buttonColors,
          onPressed: () {
            appWindow.maximizeOrRestore();
            if (appWindow.isMaximized) {
              print("mini");
              appController.userSettings.value.isFullScreen = false;
              box.write('isMaximize', false);
            } else {
              print("full");
              appController.userSettings.value.isFullScreen = true;
              box.write('isMaximize', true);
            }
          },
        ),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}
