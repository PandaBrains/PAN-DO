import 'package:flutter/material.dart';
import 'package:pan_do/core/base/view/base_view.dart';
import 'package:pan_do/core/components/text/custom_text.dart';
import 'package:pan_do/core/constants/app/app_constants.dart';
import 'package:pan_do/core/init/theme/light/color_scheme_light.dart';
import 'package:pan_do/core/init/theme/light/margin_insets.dart';
import 'package:pan_do/view/authenticate/splash/viewmodel/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SplashViewModel value) =>
          buildScaffoldBody(context, value),
    );
  }

  Scaffold buildScaffoldBody(BuildContext context, SplashViewModel value) {
    return Scaffold(
      body: Container(
        color: ColorSchemeLight.instance!.darkPurple,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: MarginInsets.instance!.formMarginLow,
                decoration: BoxDecoration(
                  color: ColorSchemeLight.instance!.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(style: BorderStyle.none),
                ),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 128,
                  height: 128,
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                ),
              ),
              CustomText(
                data: ApplicationConstants.PROJECT_NAME,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
