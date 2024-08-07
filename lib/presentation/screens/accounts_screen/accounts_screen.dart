import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scheduler_pro/core/theme/app_text_style.dart';
import 'package:scheduler_pro/presentation/screens/auth_screens/bloc/auth_bloc.dart';
import 'package:scheduler_pro/presentation/screens/auth_screens/bloc/auth_event.dart';
import 'package:scheduler_pro/presentation/screens/auth_screens/bloc/auth_state.dart';
import 'package:scheduler_pro/presentation/widgets/custom_button/custom_button.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Accounts",
                style: AppTextStyle.title3,
              ),
              28.verticalSpace,
              Row(
                children: [
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return Container(
                        width: 80.w,
                        height: 80.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: Image.network(firebaseAuth.currentUser?.photoURL ??
                                    "https://s3-alpha-sig.figma.com/img/c007/b96d/10c6847941b93f45858be7d3ce3ff3ec?Expires=1724025600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=SxjRywecKMyVDVLFAT6DRDa1BM~63bl4DvNTD7zbsG2ihcYR14C5W-bOtJTjp4PSmA2gEwocBcnqp2t0k1EPcTSFzCNkSoXlgSYu0QDVPgHoiI8z13NBLdEo7HD0ATlfcaoHY6AupjYn9j0-~0lJZN4ydgE2UQCYD~U15A-LM1sYi~dxxF0Hnk1ww7Q8m6c1WQ9bYdl~IbcPcu1AhfcSh8xJsffZ3R0RdOLNaH9itruIJe4yi~AnokhwBggvOOWh7XVX6rYpAkb-VUSFh4n5CA8hEa70irdK8Pm~~cpmvOGjEJyEuyUHeWEKMCHOV14DoAgt47Xx8DkBkJGHOc3d-Q__")
                                .image,
                          ),
                        ),
                      );
                    },
                  ),
                  16.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        firebaseAuth.currentUser?.displayName ?? "none",
                        style: AppTextStyle.largeBold,
                      ),
                      Text(
                        firebaseAuth.currentUser!.email!,
                        style: AppTextStyle.small,
                      ),
                    ],
                  ),
                ],
              ),
              28.verticalSpace,
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state.signedIn == false) {
                    context.go("/");
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    text: "Sign Out",
                    fontSize: 19.sp,
                    isLoading: state.isSubmitting,
                    onTap: () {
                      context.read<AuthBloc>().add(SignOut());
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
