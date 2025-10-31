import 'package:flutter/material.dart';
import 'package:memory_card_game/models.dart';


class GameScreen extends StatefulWidget {
  final Difficulty difficulty;
  final GameConfig config;

  const GameScreen({super.key, required this.difficulty, required this.config});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with TickerProviderStateMixin{
  List<GameCard> cards = [];
  List<int> flippedCards = [];
  int moves = 0;
  int matches = 0;
  bool canFlip = true;
  bool gameStarted = false;
  DateTime ? gameStartTime;
  late AnimationController _flipController;
  late AnimationController _matchController;
  late AnimationController _wrongController;

  final List<String> symbols = [
  '🎮',
  '🎯',
  '🎪',
  '🎨',
  '🎭',
  '🚀',
  '⚡',
  '🔥',
  '💎',
  '🌟',
  '🎵',
  '🎸',
  '🎺',
  '🎤',
  '🎹',
  '⚽',
  '🏀',
  '🎾',
  '🏐',
  '🏈',
  '🎲',
  '🎳',
  '🏟',
  '🎡',
  '🎢',
  '🎠',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initController();
    _initGame();
  }

  void _initController(){
    _flipController= AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    _matchController= AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _wrongController= AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );

  }

  @override
  void dispose() {

    _flipController.dispose();
    _matchController.dispose();
    _wrongController.dispose();
    super.dispose();
  }

  void _initGame(){
    cards.clear();
    flippedCards.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}








