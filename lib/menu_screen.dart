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
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF16213E), Color(0xFF533483)],
          ),
        ),

        child: SafeArea(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 60),
              child: Column(
                children: [
                  Text('🧠',style: TextStyle(fontSize: 80),),
                  SizedBox(height: 20),
                  Text(
                    "Memory Master",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Test your memory skills !",
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                ],
              ),
            ),
            
            Padding(padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: Difficulty.values.map((difficulty){
                final config = configs[difficulty]!;
                return Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: double.infinity,
                  child: _buildDifficultyButton(
                    context,
                    difficulty,
                    config,
                  ),
                );
              }).toList(),
            ),
            ),

            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Choose your difficulty level',
                style: TextStyle(fontSize: 20,color: Colors.white70),
              ),
            ),
          ],
         ),
        ),
      ),
    );
  }

  Widget _buildDifficultyButton(
      BuildContext context,
      Difficulty difficulty,
      GameConfig config,
      ) {
    String description = '';
    switch (difficulty) {
      case Difficulty.easy:
        description = '3x3 Grid - 4 Pairs - Perfect for beginners';
        break;
      case Difficulty.medium:
        description = '4x4 Grid - 8 Pairs - Balanced Challenge';
        break;
      case Difficulty.hard:
        description = '5x5 Grid - 12 Pairs - Expert Level';
        break;
    }

    return ElevatedButton(onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: config.color.withOpacity(0.2),
          foregroundColor: Colors.white,
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: config.color,width: 2),
          ),
          elevation: 0,
        ),

        child: Row());
  }
}








