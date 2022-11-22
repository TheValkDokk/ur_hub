import 'package:flutter/material.dart';
import 'package:ur_hub/constrain/constrain.dart';

import 'origin/origin.dart';
import 'steam/steam.dart';

class SelectedPanel extends StatelessWidget {
  const SelectedPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: selectPanel(),
        );
      },
    );
  }

  Widget selectPanel() {
    switch (appController.selectedIndex.value) {
      case 0:
        return const SteamPanel();
      case 1:
        return const OriginPanel();
      default:
        return const SteamPanel();
    }
  }
}
