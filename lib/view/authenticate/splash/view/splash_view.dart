import 'package:flutter/material.dart';
import 'package:pan_do/core/base/view/base_view.dart';
import 'package:pan_do/core/components/text/custom_text.dart';
import 'package:pan_do/core/init/theme/light/color_scheme_light.dart';
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
          child: CustomText(
            data: "PAN DO",
          ),
        ),
      ),
    );
  }
}
