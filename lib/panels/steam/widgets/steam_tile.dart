import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:drop_shadow/drop_shadow.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hoverover/hoverover.dart';
import 'package:ur_hub/models/steam/steam_user_owned_game.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:win32_registry/win32_registry.dart';
import '../../../models/steam/steam_game.dart';

class SteamTile extends StatefulWidget {
  const SteamTile({super.key, required this.game, required this.owned});

  final SteamGame game;
  final SteamOwnedGame? owned;

  @override
  State<SteamTile> createState() => _SteamTileState();
}

class _SteamTileState extends State<SteamTile> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    String playTime = "No Information";
    String lastPlay = "";
    if (widget.owned?.appid != null) {
      playTime =
          'Time Played ${(widget.owned!.playtimeForever! / 60).toStringAsFixed(1)} hours';
      lastPlay = widget.owned!.rtimeLastPlayed == 0
          ? "No play time"
          : 'Last Played: ${timeago.format(DateTime.fromMillisecondsSinceEpoch(widget.owned!.rtimeLastPlayed! * 1000))}';
    }

    return HoverOver(
      animationDurationInMilliseconds: 100,
      translateXAxis: -5,
      translateYAxis: -10,
      builder: (isHovered) {
        final color = isHovered ? Colors.orange : const Color(0xFF25293C);
        return PhysicalModel(
          elevation: isHovered ? 16 : 0,
          color: Colors.transparent,
          child: DropShadow(
            child: InkWell(
              onTap: () {},
              onHover: (v) {
                setState(() {
                  isHover = v;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: SizedBox(
                      width: Get.width * 0.1,
                      child: FancyShimmerImage(
                        imageUrl: widget.game.logo!,
                        errorWidget: SvgPicture.asset("assets/icons/steam.svg"),
                      ),
                    ),
                    title: AutoSizeText(
                      widget.game.name!,
                      maxLines: 2,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          playTime,
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white),
                        ),
                        AutoSizeText(
                          lastPlay,
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                    trailing: Column(
                      children: [
                        IconButton(
                          onPressed: () async {
                            try {
                              final key = Registry.openPath(
                                  RegistryHive.localMachine,
                                  path: r"SOFTWARE\WOW6432Node\Valve\Steam");
                              var path = key.getValueAsString('InstallPath');
                              path = path!.replaceAll('\\', '\\\\');
                              String cmd = '$path\\steam.exe ';
                              await Process.run(
                                cmd,
                                ['steam://run/${widget.game.appID}'],
                                runInShell: true,
                              );
                            } catch (e) {
                              print(e);
                            }
                          },
                          icon: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
