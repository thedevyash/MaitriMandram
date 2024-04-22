import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sehyogini_frontned/OnboardingScreens/signIn.dart';
import 'package:sehyogini_frontned/utils/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();
  var tap = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: colors.pinkMain,
      body: Container(
        decoration: BoxDecoration(color: colors.pinkMain),
        child: PageView(
          allowImplicitScrolling: true,
          onPageChanged: (value) {
            setState(() {
              tap = value;
            });
          },
          controller: _controller,
          children: [
            Stack(children: [
              Positioned(
                left: 0,
                top: height * 0.032,
                child: SvgPicture.asset(
                  height: height * 0.15,
                  "assets/leftCloud.svg",
                  color: Colors.white,
                ),
              ),
              Positioned(
                right: 0,
                top: height * 0.180,
                child: SvgPicture.asset(
                  "assets/rightCloud.svg",
                  color: Colors.white,
                  height: height * 0.15,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/sehyogini.png",
                        height: 50,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "Join our vibrant community, share experiences, and grow together!",
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     SvgPicture.asset("assets/images/onboard.svg"),
              //     SizedBox(
              //       height: 20,
              //     ),
              //     Text(
              //       textAlign: TextAlign.center,
              //       "Join our vibrant community, share experiences, and grow together!",
              //       style: GoogleFonts.poppins(
              //           color: colors.purpAcc,
              //           fontSize: 22,
              //           fontWeight: FontWeight.w300),
              //     )
              //   ],
              // ),
            ]),
            Stack(children: [
              Positioned(
                left: 0,
                top: height * 0.180,
                child: SvgPicture.asset(
                  height: height * 0.15,
                  "assets/leftCloud.svg",
                  color: Colors.white,
                ),
              ),
              Positioned(
                right: 0,
                top: height * 0.032,
                child: SvgPicture.asset(
                  "assets/rightCloud.svg",
                  color: Colors.white,
                  height: height * 0.15,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "Navigate seamlessly through features like mentorship, job board, and skill-building modules.",
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     SvgPicture.asset("assets/images/onboard.svg"),
              //     SizedBox(
              //       height: 20,
              //     ),
              //     Text(
              //       textAlign: TextAlign.center,
              //       "Join our vibrant community, share experiences, and grow together!",
              //       style: GoogleFonts.poppins(
              //           color: colors.purpAcc,
              //           fontSize: 22,
              //           fontWeight: FontWeight.w300),
              //     )
              //   ],
              // ),
            ]),
            Stack(children: [
              Positioned(
                left: 0,
                top: height * 0.032,
                child: SvgPicture.asset(
                  height: height * 0.15,
                  "assets/leftCloud.svg",
                  color: Colors.white,
                ),
              ),
              Positioned(
                right: 0,
                top: height * 0.180,
                child: SvgPicture.asset(
                  "assets/rightCloud.svg",
                  color: Colors.white,
                  height: height * 0.15,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "Start your journey towards empowerment and success with our user-friendly platform.",
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     SvgPicture.asset("assets/images/onboard.svg"),
              //     SizedBox(
              //       height: 20,
              //     ),
              //     Text(
              //       textAlign: TextAlign.center,
              //       "Join our vibrant community, share experiences, and grow together!",
              //       style: GoogleFonts.poppins(
              //           color: colors.purpAcc,
              //           fontSize: 22,
              //           fontWeight: FontWeight.w300),
              //     )
              //   ],
              // ),
            ]),
          ],
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(color: colors.pinkMain),
        constraints: BoxConstraints(minHeight: 80),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () => Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) => SignInScreen())),
                child: Text(
                  "Skip",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                )),
            SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: ScrollingDotsEffect(
                    dotColor: colors.grey, activeDotColor: Colors.white)),
            IconButton(
                onPressed: tap < 2
                    ? () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.decelerate);

                        setState(() {
                          tap++;
                        });
                      }
                    : () {
                        tap = 0;
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => SignInScreen()));
                      },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    ));
  }
}
