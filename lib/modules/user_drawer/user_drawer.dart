import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challange/modules/user_drawer/user_drawer_bloc.dart';
import 'package:flutter_challange/modules/user_drawer/user_drawer_states.dart';
import 'package:flutter_challange/shared/routes/app_routes.dart';
import 'package:flutter_challange/shared/themes/app_colors.dart';
import 'package:flutter_challange/shared/themes/app_text_styles.dart';
import 'package:go_router/go_router.dart';

import '../../di/app_providers.dart';

class UserDrawer extends StatefulWidget {
  const UserDrawer({super.key});

  @override
  State<UserDrawer> createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  final UserDrawerBloc _bloc = getIt.get<UserDrawerBloc>();

  @override
  void initState() {
    _bloc.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserDrawerBloc, UserDrawerState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state is LogoffUserDrawerState) {
          GoRouter.of(context).pushReplacement(AppRoutes.login);
        }
      },
      child: BlocBuilder<UserDrawerBloc, UserDrawerState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is SuccessUserDrawerState) {
            return Drawer(
              backgroundColor: AppColors.gradient,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.keyboard_arrow_left_outlined,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              state.user.name,
                              style: AppTextStyles.h5.copyWith(
                                color: AppColors.white.withOpacity(0.8),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            state.user.email!,
                            style: AppTextStyles.body1.copyWith(
                              color: AppColors.greyBlueText,
                            ),
                          ),
                        ),
                      ],
                    ),
                    IconLabel(
                      onTap: () => _bloc.logoff(),
                      label: 'exit',
                      padding: 25,
                      icon: Icons.logout,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class IconLabel extends StatelessWidget {
  const IconLabel({
    super.key,
    this.onTap,
    this.icon,
    required this.label,
    this.padding,
  });

  final GestureTapCallback? onTap;
  final IconData? icon;
  final String label;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding ?? 15),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(
              icon,
              size: 22,
              color: AppColors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23),
              child: Text(
                label,
                style: AppTextStyles.h6.copyWith(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
