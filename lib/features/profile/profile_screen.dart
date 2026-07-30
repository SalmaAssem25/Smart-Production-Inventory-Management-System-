import 'package:flutter/material.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/core/utils/extensions.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/features/authentication/login/login_screen.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/features/profile/profile_controller.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/features/profile/widgets/logout_button.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/features/profile/widgets/profile_header.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/features/profile/widgets/profile_info_card.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/features/profile/widgets/profile_menu_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final ProfileController controller;

  @override
  void initState() {
    super.initState();

    controller = ProfileController();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ProfileHeader(controller: controller),

            const SizedBox(height: 24),

            ProfileInfoCard(controller: controller),

            const SizedBox(height: 24),

            ProfileMenuItem(
              icon: Icons.edit,
              title: "Edit Profile",
              onTap: () {},
            ),

            ProfileMenuItem(
              icon: Icons.lock_outline,
              title: "Change Password",
              onTap: () {},
            ),

            ProfileMenuItem(
              icon: Icons.info_outline,
              title: "About",
              onTap: () {},
            ),

            const SizedBox(height: 30),

            LogoutButton(
              onPressed: () async {
                final shouldLogout = await showDialog<bool>(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Logout"),
                    content: const Text("Are you sure you want to log out?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text("Cancel"),
                      ),
                      FilledButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text("Logout"),
                      ),
                    ],
                  ),
                );

                if (shouldLogout != true) return;

                await controller.logout();

                if (!context.mounted) return;

                context.pushAndRemoveUntil(const LoginScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
