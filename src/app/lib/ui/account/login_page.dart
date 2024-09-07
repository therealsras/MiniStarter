import 'package:app/extensions/extensions.dart';
import 'package:app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/config.dart';
import '../../widgets/widgets.dart';

class LoginPage extends ConsumerWidget {
  final String? username;

  LoginPage({Key? key, this.username}) : super(key: key);

  // final loginForm = FormGroup({
  //   'userName': FormControl<String>(
  //       value: 'superadmin', validators: [Validators.required]),
  //   'password': FormControl<String>(validators: [Validators.required]),
  // });

  fillAdministration() {
    // loginForm.value = {'userName': 'superadmin', 'password': "Pa\$\$w0rd"};
  }

  fillUser() {
    // loginForm.value = {'userName': 'staff', 'password': "Pa\$\$w0rd"};
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: loginCard(context, ref));
  }

  Widget loginCard(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Form(
          child: Card(
            elevation: 8.0,
            child: Container(
              width: 1000,
              height: 500,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.localization.translate('login_form.title'),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Column(
                            children: [
                              AppTextField(
                                label: context.localization
                                    .translate('login_form.username'),
                                placeholder: context.localization.translate(
                                    'login_form.username_placeholder'),
                                formControlName: 'userName',
                                // validationMessages: (control) => {
                                //   ValidationMessage.required:
                                //       context.localization.translate(
                                //           'login_form.username_required'),
                                // },
                              ),
                              const SizedBox(height: 16),
                              AppTextField(
                                label: context.localization
                                    .translate('login_form.password'),
                                placeholder: context.localization.translate(
                                    'login_form.password_placeholder'),
                                formControlName: 'password',
                                // validationMessages: (control) => {
                                //   ValidationMessage.required:
                                //       context.localization.translate(
                                //           'login_form.password_required'),
                                // },
                                obscureText: true,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: AppSubmitButton(
                                      label: context.localization
                                          .translate('login_form.login_button'),
                                      onPress: () => ref
                                          .watch(accountProvider)
                                          // .login(loginForm.value),
                                    ),
                                  ),
                                ],
                              ),
                              Center(
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    context.localization.translate(
                                        'login_form.forgot_password'),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.apply(color: Colors.blue),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MaterialButton(
                                    onPressed: fillAdministration,
                                    child: const Text('Fill Administration'),
                                  ),
                                  MaterialButton(
                                    onPressed: fillUser,
                                    child: const Text('Fill User'),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  if (!Responsive.isMobile(context)) const VerticalDivider(),
                  if (!Responsive.isMobile(context))
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: SvgPicture.asset(
                              'assets/images/logo.svg',
                              width: 250,
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/images/login-image.svg',
                            width: 400,
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
