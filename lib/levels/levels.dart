import 'dart:async';

import 'package:adventure_fun/actors/player.dart';
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

class Level extends World {
  Level({required this.levelName});
  final String levelName;
  late TiledComponent level;

  @override
  FutureOr<void> onLoad() async {
    level = await TiledComponent.load('$levelName.tmx', Vector2.all(16));
    add(level);
    final spawnPointsLayer =
        level.tileMap.getLayer<ObjectGroup>('Spawnspoints');
    for (final spawnPoint in spawnPointsLayer!.objects) {
      switch (spawnPoint.class_) {
        case 'Player':
          final player = Player(
              character: 'Virtual Guy',
              position: Vector2(spawnPoint.x, spawnPoint.y));
          add(player);
          break;
        default:
      }
    }
    return super.onLoad();
  }
}
