import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lancemeup_workspace_ui/common/constant/app_color_constant.dart';
import 'package:lancemeup_workspace_ui/entry_screen.dart';
import 'package:lancemeup_workspace_ui/utils/form_validation/form_validation_extension.dart';
import '../../../common/constant/app_contant.dart';
import '../../../utils/cust_textform_field.dart/custome_textform_field.dart';
import '../../../utils/custom_navigation/app_nav.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late bool isvisible;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();
  bool remberPassword = false;
  late bool isLoading;
  @override
  void initState() {
    isvisible = true;
    isLoading = false;
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  checkBox(value) {
    setState(() {});
    remberPassword = value!;
    // log(remberPassword.toString());
  }

  dismissKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      return currentFocus.unfocus();
    }
  }

  toogleVisibility() {
    setState(() {});
    isvisible = !isvisible;
  }

  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    double screenH = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstant.ksignIn),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      AppConstant.kwelcomeBack,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const Text(
                    AppConstant.kLogintoyouraccount,
                  ),
                  SizedBox(
                    height: screenH * 0.01,
                  ),
                  CustomTextformFormField(
                    // hintText: AppConstant.kEmail,
                    isLablerequire: true,
                    controller: emailController,
                    label: AppConstant.kEmail,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    // validator: (input) => input!.isValidEmail(input),
                  ),
                  CustomTextformFormField(
                    label: AppConstant.kPassword,
                    obscureText: isvisible,
                    // hintText: AppConstant.kPassword,
                    issuffixIconrequired: IconButton(
                        onPressed: toogleVisibility,
                        icon: Icon(
                          isvisible ? Icons.visibility_off : Icons.visibility,
                          size: 16,
                        )),
                    isLablerequire: true,
                    controller: passwordController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                    validator: (input) => input!.isPasswordValid(input),
                  ),
                  SizedBox(
                    height: screenH * 0.01,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Theme(
                      data: ThemeData(
                          unselectedWidgetColor:
                              AppColorResources.kTextLightGrey),
                      child: Checkbox(
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          activeColor: AppColorResources.appPrimaryColor,
                          value: remberPassword,
                          onChanged: checkBox),
                    ),
                    const Text(
                      AppConstant.krememberMe,
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    AppConstant.kforgotPassword,
                    style: TextStyle(
                        color: AppColorResources.appPrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenH * 0.19,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                  // surfaceTintColor: AppColorResources.appPrimaryColor,
                  backgroundColor: AppColorResources.appPrimaryColor,
                  foregroundColor: AppColorResources.white,
                  fixedSize: Size(screenW, screenH * 0.058),
                ),
                onPressed: () async {
                  normalNav(context: context, screen: const MainPage());
                  setState(() {
                    isLoading = true;
                  });
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: screenW * 0.04),
                child: RichText(
                  text: TextSpan(
                      text: "${AppConstant.kDonthaveaccount} ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColorResources.kTextLightGrey),
                      children: <TextSpan>[
                        TextSpan(
                            text: AppConstant.ksignUp,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: AppColorResources.appPrimaryColor,
                                ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                normalNav(
                                    context: context, screen: const Text(""));
                              })
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class CustomCheckbox extends StatefulWidget {
//   const CustomCheckbox({
//     Key? key,
//     this.width = 24.0,
//     this.height = 24.0,
//     this.color = Colors.white,
//     this.iconSize,
//     this.onChanged,
//     this.checkColor,
//   }) : super(key: key);

//   final double width;
//   final double height;
//   final Color color;
//   // Now you can set the checkmark size of your own
//   final double? iconSize;
//   final Color? checkColor;
//   final Function(bool?)? onChanged;

//   @override
//   State<CustomCheckbox> createState() => _CustomCheckboxState();
// }

// class _CustomCheckboxState extends State<CustomCheckbox> {
//   bool isChecked = false;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         setState(() => isChecked = !isChecked);
//       },
//       child: Container(
//           alignment: Alignment.center,
//           width: widget.width,
//           height: widget.height,
//           decoration: BoxDecoration(
//             color: isChecked ? AppColorResources.textRed : Colors.white,
//             border: Border.all(
//               color:
//                   isChecked ? AppColorResources.appPrimaryColor : Colors.white,
//               width: 2.0,
//             ),
//             borderRadius: BorderRadius.circular(6.0),
//           ),
//           child: Icon(
//             Icons.check,
//             size: widget.iconSize,
//             color:
//                 isChecked ? AppColorResources.white : AppColorResources.white,
//           )),
//     );
//   }
// }
