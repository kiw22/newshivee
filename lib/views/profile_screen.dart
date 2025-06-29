import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newshive/views/utils/helper.dart';
import 'package:newshive/views/widgets/profile_menu_tile.dart';
import 'widgets/profile_data_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset('assets/images/Meliuk-liuk.png'),
              Text('Data Diri', style: headline4),
              vsTiny,
            ],
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  'Profil',
                  style: headline3.copyWith(color: cPrimary, fontWeight: bold),
                ),
                vsTiny,
                Container(
                  padding: REdgeInsets.all(12.0),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: cWhite,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CircleAvatar(
                          backgroundColor: cGrey,
                          radius: 70.r,
                          backgroundImage: AssetImage(
                            'assets/images/news logo.png',
                          ),
                        ),
                      ),
                      vsSmall,
                      ProfileDataWidget(
                        profile: 'Name',
                        dataProfile: ': Theresa Webb',
                      ),
                      vsTiny,
                      ProfileDataWidget(
                        profile: 'Email',
                        dataProfile: ': theresa_we@gmail.com',
                      ),
                      vsTiny,
                      ProfileDataWidget(
                        profile: 'Number',
                        dataProfile: ': 089876543210',
                      ),
                      vsTiny,
                      ProfileDataWidget(
                        profile: 'Address',
                        dataProfile:
                            ': Jl. Cangkring Raya, Maleer, Kec. Batununggal, Kota Bandung, Jawa Barat',
                      ),
                    ],
                  ),
                ),
                vsLarge,
                ProfileMenuTile(
                  title: 'Edit Profile',
                  onTap: () {
                    log('Edit Profile onTap');
                  },
                  leading: Icon(Icons.border_color_outlined, color: cBlack),
                  trailing: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: cBlack,
                  ),
                ),
                Divider(color: cBlack, height: 4.0),
                ProfileMenuTile(
                  title: 'Edit Password',
                  onTap: () {
                    log('Edit Password onTap');
                  },
                  leading: Icon(Icons.password, color: cBlack),
                  trailing: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: cBlack,
                  ),
                ),
                Divider(color: cBlack, height: 4.0),
                ProfileMenuTile(
                  title: 'Logout',
                  onTap: () {
                    log('Logout onTap');
                  },
                  leading: Icon(Icons.logout_rounded, color: cBlack),
                  trailing: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: cBlack,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
