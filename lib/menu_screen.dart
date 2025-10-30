import 'package:flutter/material.dart';
import 'package:memory_card_game/models.dart';

class MenuScreen extends StatelessWidget {
  final Map<Difficulty, GameConfig> configs = {
    Difficulty.easy: GameConfig(
      gridSize: 3,
      pairs: 4,
      name: 'Easy',
      color: Colors.green,
      icon: Icons.sentiment_very_satisfied,
    ),

    Difficulty.medium: GameConfig(
      gridSize: 4,
      pairs: 8,
      name: 'Medium',
      color: Colors.orange,
      icon: Icons.sentiment_satisfied,
    ),

    Difficulty.hard: GameConfig(
      gridSize: 5,
      pairs: 12,
      name: 'Hard',
      color: Colors.redAccent,
      icon: Icons.sentiment_very_dissatisfied,
    ),
  };

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
