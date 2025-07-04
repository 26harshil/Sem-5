import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(AirHockeyApp());
}

class AirHockeyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Air Hockey',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AirHockeyGame(),
      debugShowCheckedModeBanner: false,
    );
  }
}
// ...existing code...

class AirHockeyGame extends StatefulWidget {
  @override
  _AirHockeyGameState createState() => _AirHockeyGameState();
}

class _AirHockeyGameState extends State<AirHockeyGame>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  // Game objects
  Puck puck = Puck();
  Paddle player1 = Paddle(isPlayer1: true);
  Paddle player2 = Paddle(isPlayer1: false);

  // Game state
  int player1Score = 0;
  int player2Score = 0;
  bool gameStarted = false;

  // Game dimensions
  double gameWidth = 0;
  double gameHeight = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 16), // ~60 FPS
      vsync: this,
    );
    _controller.addListener(_updateGame);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startGame() {
    setState(() {
      gameStarted = true;
      _resetPuck();
    });
    _controller.repeat();
  }

  void _pauseGame() {
    setState(() {
      gameStarted = false;
    });
    _controller.stop();
  }

  void _resetGame() {
    setState(() {
      player1Score = 0;
      player2Score = 0;
      gameStarted = false;
      _resetPuck();
    });
    _controller.stop();
  }

  void _resetPuck() {
    puck.x = gameWidth / 2;
    puck.y = gameHeight / 2;
    puck.velocityX = (math.Random().nextBool() ? 1 : -1) * 2.0;
    puck.velocityY = (math.Random().nextBool() ? 1 : -1) * 2.0;
  }

  void _updateGame() {
    if (!gameStarted) return;

    setState(() {
      // Update puck position
      puck.x += puck.velocityX;
      puck.y += puck.velocityY;

      // Wall collisions
      if (puck.x <= puck.radius) {
        puck.x = puck.radius;
        puck.velocityX = -puck.velocityX * 0.8;
      }
      if (puck.x >= gameWidth - puck.radius) {
        puck.x = gameWidth - puck.radius;
        puck.velocityX = -puck.velocityX * 0.8;
      }

      // Goal detection
      if (puck.y <= 0) {
        player1Score++;
        _resetPuck();
      }
      if (puck.y >= gameHeight) {
        player2Score++;
        _resetPuck();
      }

      // Top and bottom boundaries (not goals)
      double goalWidth = gameWidth * 0.3;
      double goalStart = (gameWidth - goalWidth) / 2;
      double goalEnd = goalStart + goalWidth;

      if (puck.y <= puck.radius && (puck.x < goalStart || puck.x > goalEnd)) {
        puck.y = puck.radius;
        puck.velocityY = -puck.velocityY * 0.8;
      }
      if (puck.y >= gameHeight - puck.radius &&
          (puck.x < goalStart || puck.x > goalEnd)) {
        puck.y = gameHeight - puck.radius;
        puck.velocityY = -puck.velocityY * 0.8;
      }

      // Paddle collisions
      _checkPaddleCollision(player1);
      _checkPaddleCollision(player2);

      // Apply friction
      puck.velocityX *= 0.995;
      puck.velocityY *= 0.995;
    });
  }

  void _checkPaddleCollision(Paddle paddle) {
    double dx = puck.x - paddle.x;
    double dy = puck.y - paddle.y;
    double distance = math.sqrt(dx * dx + dy * dy);

    if (distance < puck.radius + paddle.radius) {
      // Collision detected
      double angle = math.atan2(dy, dx);
      double targetX =
          paddle.x + math.cos(angle) * (puck.radius + paddle.radius);
      double targetY =
          paddle.y + math.sin(angle) * (puck.radius + paddle.radius);

      puck.x = targetX;
      puck.y = targetY;

      // Calculate new velocity
      double force = 0.3;
      puck.velocityX = math.cos(angle) * force * 10;
      puck.velocityY = math.sin(angle) * force * 10;
    }
  }

  void _onPanUpdate(DragUpdateDetails details, bool isPlayer1) {
    RenderBox box = context.findRenderObject() as RenderBox;
    Offset localPosition = box.globalToLocal(details.globalPosition);

    Paddle paddle = isPlayer1 ? player1 : player2;

    setState(() {
      paddle.x = localPosition.dx.clamp(
        paddle.radius,
        gameWidth - paddle.radius,
      );
      paddle.y = localPosition.dy.clamp(
        paddle.radius,
        gameHeight - paddle.radius,
      );

      // Restrict paddle movement to their half
      if (isPlayer1) {
        paddle.y = paddle.y.clamp(gameHeight / 2, gameHeight - paddle.radius);
      } else {
        paddle.y = paddle.y.clamp(paddle.radius, gameHeight / 2);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            gameWidth = constraints.maxWidth;
            gameHeight =
                constraints.maxHeight - 120; // Reserve space for score/buttons

            // Initialize paddle positions
            if (player1.x == 0) {
              player1.x = gameWidth / 2;
              player1.y = gameHeight * 0.8;
              player2.x = gameWidth / 2;
              player2.y = gameHeight * 0.2;
            }

            return Column(
              children: [
                // Score and buttons
                Container(
                  height: 120,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Player 2 Score
                      _scoreCard('Player 2', player2Score, Colors.red),
                      // Buttons
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[700],
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                            ),
                            icon: Icon(
                              gameStarted ? Icons.pause : Icons.play_arrow,
                            ),
                            label: Text(gameStarted ? 'Pause' : 'Start'),
                            onPressed: gameStarted ? _pauseGame : _startGame,
                          ),
                          SizedBox(height: 10),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey[700],
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                            ),
                            icon: Icon(Icons.refresh),
                            label: Text('Reset'),
                            onPressed: _resetGame,
                          ),
                        ],
                      ),
                      // Player 1 Score
                      _scoreCard('Player 1', player1Score, Colors.blue),
                    ],
                  ),
                ),
                // Game area
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: GestureDetector(
                        onPanUpdate: (details) {
                          RenderBox box =
                              context.findRenderObject() as RenderBox;
                          Offset localPosition = box.globalToLocal(
                            details.globalPosition,
                          );

                          // Determine which player based on Y position
                          bool isPlayer1 = localPosition.dy > gameHeight / 2;
                          _onPanUpdate(details, isPlayer1);
                        },
                        child: CustomPaint(
                          painter: GamePainter(
                            puck,
                            player1,
                            player2,
                            gameWidth,
                            gameHeight,
                          ),
                          size: Size(gameWidth, gameHeight),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _scoreCard(String label, int score, Color color) {
    return Card(
      color: color.withOpacity(0.85),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      child: Container(
        width: 100,
        height: 80,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 4),
            Text(
              '$score',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(color: Colors.black26, blurRadius: 4)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GamePainter extends CustomPainter {
  final Puck puck;
  final Paddle player1;
  final Paddle player2;
  final double width;
  final double height;

  GamePainter(this.puck, this.player1, this.player2, this.width, this.height);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Draw field
    paint.color = Colors.green[700]!;
    canvas.drawRect(Rect.fromLTWH(0, 0, width, height), paint);

    // Draw center line
    paint.color = Colors.white.withOpacity(0.7);
    paint.strokeWidth = 3;
    canvas.drawLine(Offset(0, height / 2), Offset(width, height / 2), paint);

    // Draw center circle
    paint.style = PaintingStyle.stroke;
    paint.color = Colors.white.withOpacity(0.7);
    canvas.drawCircle(Offset(width / 2, height / 2), 50, paint);

    // Draw goals
    double goalWidth = width * 0.3;
    double goalStart = (width - goalWidth) / 2;

    paint.style = PaintingStyle.fill;
    paint.color = Colors.red[300]!;

    // Top goal (Player 2's goal)
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(goalStart, 0, goalWidth, 20),
        Radius.circular(10),
      ),
      paint,
    );

    // Bottom goal (Player 1's goal)
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(goalStart, height - 20, goalWidth, 20),
        Radius.circular(10),
      ),
      paint,
    );

    // Draw borders
    paint.color = Colors.brown[700]!;
    paint.strokeWidth = 8;
    paint.style = PaintingStyle.stroke;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, width, height),
        Radius.circular(24),
      ),
      paint,
    );

    // Draw puck (as a ball with shadow and gradient)
    final puckCenter = Offset(puck.x, puck.y);
    final shadowPaint =
        Paint()
          ..color = Colors.black.withOpacity(0.25)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 8);
    canvas.drawCircle(
      puckCenter.translate(4, 6),
      puck.radius * 1.1,
      shadowPaint,
    );

    final gradient = RadialGradient(
      colors: [Colors.white, Colors.grey[700]!, Colors.black],
      stops: [0.0, 0.6, 1.0],
    );
    final rect = Rect.fromCircle(center: puckCenter, radius: puck.radius);
    paint.shader = gradient.createShader(rect);
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(puckCenter, puck.radius, paint);
    paint.shader = null;

    // Draw paddles
    // Player 1 (bottom)
    paint.color = Colors.blue[700]!;
    canvas.drawCircle(Offset(player1.x, player1.y), player1.radius, paint);

    // Player 2 (top)
    paint.color = Colors.red[700]!;
    canvas.drawCircle(Offset(player2.x, player2.y), player2.radius, paint);

    // Draw paddle highlights
    paint.color = Colors.white.withOpacity(0.7);
    canvas.drawCircle(
      Offset(player1.x - 7, player1.y - 7),
      player1.radius * 0.35,
      paint,
    );
    canvas.drawCircle(
      Offset(player2.x - 7, player2.y - 7),
      player2.radius * 0.35,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// ...existing code...
class Puck {
  double x = 0;
  double y = 0;
  double velocityX = 0;
  double velocityY = 0;
  double radius = 15;
}

class Paddle {
  double x = 0;
  double y = 0;
  double radius = 30;
  bool isPlayer1;

  Paddle({required this.isPlayer1});
}
