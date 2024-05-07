import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantist_case_app/controllers/auth_controller.dart';
import 'package:plantist_case_app/routes/app_routes.dart';
import 'package:plantist_case_app/services/firedb.dart';
import 'package:plantist_case_app/utils/text_styles.dart';
import 'package:plantist_case_app/widgets/custom_icon_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Plantist',
                      style: TextStyles.titleTextBig(),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            CupertinoIcons.search,
                            weight: 0.7,
                            size: TextStyles.titleTextBig().fontSize!,
                          ),
                          onPressed: () {
                            print('Search button pressed');
                          },
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          icon: Icon(
                            Icons.logout_rounded,
                            weight: 0.1,
                            size: TextStyles.titleTextBig().fontSize!,
                          ),
                          onPressed: () => _onLogOutPressed(),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'WELCOME BACK',
                      style: TextStyles.titleTextBig(),
                    ),
                    const SizedBox(height: 10),
                    Icon(
                      Icons.check_circle,
                      color: Get.find<AuthController>().activeUser != null
                          ? Colors.green
                          : Colors.grey,
                      size: 150,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                CustomIconButton(
                  text: 'POST DATA',
                  onPressed: _postLogic,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onLogOutPressed() {
    Get.find<AuthController>()
        .signOut()
        .then((_) => Get.offAllNamed(AppRoutes.welcomeScreen));
  }

  void _postLogic() {
    Firedb.postNewItem();
  }
}
