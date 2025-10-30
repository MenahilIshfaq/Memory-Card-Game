import 'package:flutter/material.dart';

enum Difficulty {
  easy,
  medium,
  hard,
}

class GameConfig {
  final int gridSize;
  final int pairs;
  final String name;
  final Color color;
  final IconData icon;

  GameConfig({
    required this.gridSize,
    required this.pairs,
    required this.name,
    required this.color,
    required this.icon
  });
}

class GameCard {
  final int id;
  final String symbol;
  bool isFlipped;
  bool isMatched;
  bool isAnimating;

  GameCard({
    required this.id,
    required this.symbol,
    this.isFlipped = false,
    this.isMatched = false,
    this.isAnimating = false,
});
}