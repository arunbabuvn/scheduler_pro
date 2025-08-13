import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:scheduler_pro/core/theme/app_colors.dart';
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
      appBar: AppBar(
        title: Text(
          "Accounts",
          style: AppTextStyle.title3,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      final photoURL = state.firebaseAuth.currentUser?.photoURL;
                      return CircleAvatar(
                        radius: 30.w,
                        backgroundColor: AppColors.secondartyColor,
                        backgroundImage:
                            photoURL != null ? NetworkImage(photoURL) : null,
                        child: photoURL == null
                            ? Icon(Icons.person,
                                size: 30.w, color: AppColors.darkTextColor)
                            : null,
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
