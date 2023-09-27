import 'package:adventure_fun/pixel_adventure.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.setLandscape();
  Flame.device.fullScreen();
  PixelAdventure game = PixelAdventure();
  runApp(
    GameWidget(
      game: kDebugMode ? PixelAdventure() : game,
    ),
  );
}
