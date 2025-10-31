import 'dart:math';

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
    moves = 0;
    matches = 0;
    canFlip = true;
    gameStarted = false;
    gameStartTime = null;

    List<String> gameSymbols = symbols.take(widget.config.pairs).toList();
    List<String> cardPairs = [...gameSymbols, ...gameSymbols];

    int totalCards = widget.config.gridSize * widget.config.gridSize;
    while(cardPairs.length < totalCards){
      cardPairs.add('⭐');
    }

    cardPairs.shuffle(Random());

    for (int i = 0; i < totalCards; i++){
      cards.add(GameCard(id: i, symbol: cardPairs[i]));
    }
    setState(() {

    });
  }

  void _flipCard(int index){
    if(!canFlip ||
        cards[index].isFlipped ||
        cards[index].isMatched ||
        cards[index].isAnimating ||
        flippedCards.length>=2) {
      return;
    }
    if(!gameStarted){
      gameStarted = true;
      gameStartTime = DateTime.now();
    }

    setState(() {
      cards[index].isFlipped = true;
      cards[index].isAnimating = true;
      flippedCards.add(index);
    });

    _flipController.forward().then((_) {
      _flipController.reset();
      cards[index].isAnimating = false;
    });

    if (flippedCards.length == 2) {
      moves ++;
      _checkForMatch();
    }
  }

  void _checkForMatch (){
    canFlip= false;
    Future.delayed(Duration(milliseconds: 600),(){
      if(!mounted) return;

      int firstIndex = flippedCards[0];
      int secondIndex = flippedCards[1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}








