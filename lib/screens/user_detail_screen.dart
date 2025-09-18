import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../screens/colors.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;

  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        elevation: 4,
        shadowColor: AppColors.background1.withOpacity(0.4),
        title: Text(
          user.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            // Profile card
            _buildAnimatedCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "avatar_${user.id}",
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: const Color.fromARGB(255, 211, 199, 178),
                      child: Text(
                        user.name[0],
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.text,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    user.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '@${user.username}',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.text,
                    ),
                  ),
                  const Divider(height: 24, thickness: 2),
                  _buildInfoRow(Icons.email, user.email),
                  const SizedBox(height: 12),
                  _buildInfoRow(Icons.phone, user.phone),
                  const SizedBox(height: 12),
                  _buildInfoRow(Icons.language, user.website),
                ],
              ),
            ),

            const SizedBox(height: 20),
            _buildSectionHeader(Icons.home, "Address :-"),
            _buildAnimatedCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.address.street}, ${user.address.suite}, ${user.address.city}, ${user.address.zipcode}',
                    style: const TextStyle(fontSize: 17, color: AppColors.text,fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Geo : ${user.address.geo.lat}, ${user.address.geo.lng}',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            _buildSectionHeader(Icons.business, "Company :-"),
            _buildAnimatedCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'name :- ${user.company.name}',
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text,
                      
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'catchPhrase :- ${user.company.catchPhrase}',
                    style: const TextStyle(
                      fontSize: 17,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'bs :- ${user.company.bs}',
                    style: const TextStyle(
                      fontSize: 17,
                      color: AppColors.text,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Animated Card for smooth entry and hover effect
  Widget _buildAnimatedCard({required Widget child}) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 600),
      tween: Tween<double>(begin: 0, end: 1),
      curve: Curves.easeOutCubic,
      builder: (context, double value, _) {
        return Transform.translate(
          offset: Offset(0, 30 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: Card(
              elevation: 6,
              shadowColor: AppColors.background1.withOpacity(0.4),
              color: AppColors.secondary.withOpacity(0.95),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionHeader(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: AppColors.background1, size: 22),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.text,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 22, color: AppColors.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 17, color: AppColors.text,fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
