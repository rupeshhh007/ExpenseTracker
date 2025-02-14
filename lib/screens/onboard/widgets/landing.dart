import 'package:expense_tracker/helpers/color.helper.dart';
import 'package:expense_tracker/widgets/buttons/button.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final VoidCallback onGetStarted;
  const LandingPage({super.key, required this.onGetStarted});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background, // fallback for light mode
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1A1A4B), // Dark blue
                Color(0xFF2E2E8C), // Purple
                Color(0xFF4A4AE1), // Light purple
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.5, 1.0],
            ),
            image: DecorationImage(
              image: AssetImage('assets/images/space.jpeg'), 
              fit: BoxFit.cover,
              opacity: 0.3, // Adjust for visibility of stars
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Glowing Title ("ExpenseTracker")
              _buildGlowingTitle(theme),
              const SizedBox(height: 15),

              // Subtitle with softer color
              Text(
                "Easy method to manage your savings",
                style: theme.textTheme.headlineMedium!.apply(
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 25),

              // Feature 1
              _buildFeatureRow(
                context,
                "Using our app, manage your finances.",
              ),

              // Feature 2
              _buildFeatureRow(
                context,
                "Simple expense monitoring for more accurate budgeting",
              ),

              // Feature 3
              _buildFeatureRow(
                context,
                "Keep track of your spending whenever and wherever you are.",
              ),

              const Expanded(child: SizedBox()),

              // Disclaimer text
              Text(
                "By Clicking on get started you agree to our",
                style: theme.textTheme.bodySmall!.apply(
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
              Text(
                "Terms and Conditions",
                style: theme.textTheme.bodySmall!.apply(
                  color: const Color.fromARGB(255, 131, 193, 243).withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 20),

              // Get Started Button
              Container(
                alignment: Alignment.bottomRight,
                child: AppButton(
                  color: theme.colorScheme.inversePrimary,
                  isFullWidth: true,
                  onPressed: onGetStarted,
                  size: AppButtonSize.large,
                  label: "Get Started",
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Glowing Title Widget
  Widget _buildGlowingTitle(ThemeData theme) {
    return Text(
      "ExpenseTracker",
      style: theme.textTheme.headlineLarge!.apply(
        color: Colors.white, // White for contrast
        fontWeightDelta: 4,
        fontSizeDelta: 7,
      ).copyWith(
        // Glowing effect with shadow
        shadows: [
          Shadow(
            blurRadius: 15.0,
            color: Colors.blue.withOpacity(0.7),  // Soft blue glow
            offset: Offset(0, 0),
          ),
          Shadow(
            blurRadius: 25.0,
            color: Colors.purple.withOpacity(0.6),  // Purple glow for depth
            offset: Offset(0, 0),
          ),
          Shadow(
            blurRadius: 35.0,
            color: Colors.white.withOpacity(0.9),  // Strong white glow
            offset: Offset(0, 0),
          ),
        ],
      ),
    );
  }

  // Helper widget to simplify feature row creation
  Widget _buildFeatureRow(BuildContext context, String text) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(Icons.check_circle, color: Colors.white),
          const SizedBox(width: 15),
          Expanded(child: Text(text, style: TextStyle(color: Colors.white))),
        ],
      ),
    );
  }
}
