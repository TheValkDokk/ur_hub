import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';
import 'package:ur_hub/constrain/constrain.dart';

import '../../models/steam/steam_user.dart';
import 'widgets/steam_main_panel.dart';
import 'widgets/steam_search.dart';

class SteamPanel extends StatelessWidget {
  const SteamPanel({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController txt = TextEditingController();
    return Obx(() {
      return AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        child: appController.haveSteamUser.value
            ? SteamUsable(txt: txt)
            : const SteamIdInput(),
      );
    });
  }
}

class SteamUsable extends StatelessWidget {
  const SteamUsable({
    Key? key,
    required this.txt,
  }) : super(key: key);

  final TextEditingController txt;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PlatformTextButton(
                  onPressed: () {
                    var u = SteamUser(customURL: 31194.toString());
                    appController.userSettings.value =
                        appController.userSettings.value.copyWith(steamUser: u);
                  },
                  child: const Text("Change Name"),
                ),
                Expanded(
                  child: AutoSizeText(
                    "Hi ${appController.userSettings.value.steamUser!.steamID}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                PlatformIconButton(
                    icon: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                )),
              ],
            ),
          ),
        ),
        SteamSearchInput(hintText: "Search", searchController: txt),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: SteamMainPanel(),
          ),
        )
      ],
    );
  }
}

class SteamIdInput extends StatelessWidget {
  const SteamIdInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 600,
        child: Column(
          children: [
            TextField(
              onSubmitted: (value) {
                if (value.isEmpty) {
                  Get.snackbar("", "ERROR WRONG NAME");
                } else {
                  appController.userId.value = value;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
