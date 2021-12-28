
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ProfilePageBody extends StatefulWidget {
  const ProfilePageBody({Key? key}) : super(key: key);

  @override
  _ProfilePageBodyState createState() => _ProfilePageBodyState();
}

class _ProfilePageBodyState extends State<ProfilePageBody>
    with AutomaticKeepAliveClientMixin {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    var _isTurned = true;
    // final ChromeSafariBrowser browser = new MyChromeSafariBrowser(
    //   new WebViewContent());
    // final currentUser = firebase_auth.FirebaseAuth.instance.currentUser;
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          backgroundColor: Colors.black,
          floating: true,
          title: Text(
            'Profile',
            // style: ,
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              //header
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 1,
                      decoration: BoxDecoration(
                        backgroundBlendMode: BlendMode.darken,
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/avi-bkg.jpg',
                          ),
                        ),
                      ),
                    ),

                    //details
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 72,
                          width: 72,
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: ClipOval(
                           child: CachedNetworkImage(
                             imageUrl: 'assets/profile.png'
                           ),                            
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              'Fredrick Mwenda',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'mwendafredrick31',
                              style: TextStyle(
                                color: Color(0xff858AA1),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //general title
              const Padding(
                padding:
                    EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 0),
                child: Text(
                  'ACCOUNT',
                  // style: initialsText.copyWith(
                  //   fontSize: 12.0.sp,
                  //   letterSpacing: 1,
                  // ),
                ),
              ),

              //name
              ListTile(
                onTap: () {},
                dense: true,
                leading: const Icon(
                  Icons.person_outlined,
                  color: Colors.white,
                  size: 24,
                ),
                title: const Text(
                  'Name',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                subtitle: const Text(
                  'fredrick mwenda',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              //username
              ListTile(
                onTap: () {},
                dense: true,
                leading: const Icon(
                  Icons.alternate_email_outlined,
                  color: Colors.white,
                  size: 24,
                ),
                title: const Text(
                  'Username',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                subtitle: const Text(
                  'fredrick',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              //email
              ListTile(
                onTap: () {},
                dense: true,
                leading: const Icon(
                  Icons.email_outlined,
                  color: Colors.white,
                  size: 24,
                ),
                title: const Text(
                  'E-mail',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                subtitle: const Text(
                  'mwendafredrick31@gmail.com',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Divider(height: 1),

              const Padding(
                padding:
                    EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 0),
                child: Text(
                  'GENERAL',
                  // style: initialsText.copyWith(
                  //   fontSize: 12.0.sp,
                  //   letterSpacing: 1,
                  // ),
                ),
              ),

              // notifs
              ListTile(
                onTap: () {
                  // AppSettings.openNotificationSettings();
                },
                dense: true,
                leading: const Icon(
                  Icons.notifications_active_outlined,
                  color: Colors.white,
                  size: 24,
                ),
                title: const Text(
                  'Notifications',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                subtitle: const Text(
                  'Manage your preferences for notifications',
                ),
                trailing: Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                        value: _isTurned,
                        onChanged: (value) {
                          setState(() {
                            _isTurned = value;
                          });
                        })),
              ),
              // theme
              ListTile(
                onTap: () {},
                dense: true,
                leading: const Icon(
                  Icons.block,
                  color: Colors.white,
                  size: 24,
                ),
                title: const Text(
                  'Settings',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                subtitle: const Text(
                  'View settings',
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.white,
                ),
              ),
              const Divider(height: 1),

              //feedback title
              const Padding(
                padding:
                    EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 0),
                child: Text(
                  'FEEDBACK',
                  // style: initialsText.copyWith(
                  //   fontSize: 12.0.sp,
                  //   letterSpacing: 1,
                  // ),
                ),
              ),

              //bug report
              ListTile(
                onTap: () {},
                //  => _launchLink(url: "https://forms.gle/XfJAZdrDPTJtzcKo7"),
                dense: true,
                leading: const Icon(
                  Icons.bug_report_outlined,
                  color: Colors.white,
                  size: 24,
                ),
                title: const Text(
                  'Report Bug',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.white,
                ),
              ),

              //feedback
              ListTile(
                onTap: () {},
                dense: true,
                leading: const Icon(
                  Icons.feedback_outlined,
                  color: Colors.white,
                  size: 24,
                ),
                title: const Text(
                  'Feedback',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.white,
                ),
              ),

              //contact developer
              ListTile(
                onTap: () {},
                dense: true,
                leading: const Icon(
                  Icons.send_outlined,
                  color: Colors.white,
                  size: 24,
                ),
                title: const Text(
                  'Rate the App',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.white,
                ),
              ),
              const Divider(height: 1),

              //data & privacy title
              const Padding(
                padding:
                    EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 0),
                child: Text(
                  'DATA & PRIVACY',
                  // style: initialsText.copyWith(
                  //   fontSize: 12.0.sp,
                  //   letterSpacing: 1,
                  // ),
                ),
              ),

              //privacy policy
              ListTile(
                onTap: () {},
                //   async => await browser.open(
                //       url:
                // 'https://www.freeprivacypolicy.com/live/7d83b341-6b48-4456-983a-8a7e00a3f107'),
                dense: true,
                leading: const Icon(
                  Icons.lock_outlined,
                  color: Colors.white,
                  size: 24,
                ),
                title: const Text(
                  'Privacy policy',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.white,
                ),
              ),

              //terms of service
              ListTile(
                onTap: () {},
                // async => await browser.open(
                //   url:'https://www.websitepolicies.com/policies/view/WsmWyfO6'),
                dense: true,
                leading: const Icon(
                  Icons.account_balance_outlined,
                  color: Colors.white,
                  size: 24,
                ),
                title: const Text(
                  'Terms of service',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.white,
                ),
              ),

              const Divider(height: 1),

              //log out title
              const Padding(
                padding:
                    EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 0),
                child: Text(
                  'LOG OUT',
                  // style: initialsText.copyWith(
                  //   fontSize: 12.0.sp,
                  //   letterSpacing: 1,
                  // ),
                ),
              ),

              //log out
              Theme(
                data: ThemeData(
                  splashColor: const Color(0xff170605),
                  highlightColor: const Color(0xff170605),
                ),
                child: ListTile(
                  dense: false,
                  onTap: () {},
                  // => context
                  // .read<AuthenticationBloc>()
                  // .add(AuthenticationLogoutRequested()),
                  leading: const Icon(
                    Icons.exit_to_app_outlined,
                    color: Colors.red,
                    size: 24,
                  ),
                  title: const Text(
                    'Log Out',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),

              //delete acccount
              Theme(
                data: ThemeData(
                  splashColor: const Color(0xff170605),
                  highlightColor: const Color(0xff170605),
                ),
                child: ListTile(
                  dense: false,
                  onTap: () {},
                  // => context
                  // .read<AuthenticationBloc>()
                  // .add(AuthenticationDeleteRequested()),
                  leading: const Icon(
                    Icons.person_remove_alt_1_outlined,
                    color: Colors.red,
                    size: 24,
                  ),
                  title: const Text(
                    'Delete account',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              const Divider(height: 1.0),
              Container(height: 16.0),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
