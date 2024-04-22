// import 'dart:js_util';

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';

import 'package:sehyogini_frontned/controllers/getPostByID.dart';
import 'package:sehyogini_frontned/controllers/get_posts_controller.dart';
import 'package:sehyogini_frontned/controllers/likeComment_controller.dart';
import 'package:sehyogini_frontned/controllers/makeAPost_controller.dart';
// import 'package:sehyogini_frontned/models/posts.dart';
import 'package:sehyogini_frontned/utils/constants.dart';
import 'package:sehyogini_frontned/utils/localisation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen>
    with TickerProviderStateMixin {
  GetPostsController getPostsController = Get.put(GetPostsController());
  GetPostByIdController getPostByidController =
      Get.put(GetPostByIdController());
  MakeLikeCommentController likeCommentController =
      Get.put(MakeLikeCommentController());
  MakeAPostController postController = Get.put(MakeAPostController());
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  LocaleController localeController = Get.put(LocaleController());
  void dolike(String id) async {
    var resp = await likeCommentController.doLike(id);
    if (resp) {
      // print(getPostsController.myModel[0].likes!.length);
      // getPostsController.getPostById(id);

      setState(() {});
    }
  }

  void docomment(String id) async {
    var resp = await likeCommentController.doComment(id);
    if (resp) {
      // print(getPostsController.myModel[0].likes!.length);
      // getPostsController.getPostById(id);
      getPostByidController.update();
      setState(() {});
    }
  }

  // Future<Post> getpostdata(int index) async {
  //   return await getPostByidController
  //       .getPostById(getPostsController.myModel[index].sId!);
  // }

  Future<void> onrefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    getPostsController.getPost();
  }

  Future<void> onefreshCom() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {});
  }

  Future<String> getID() async {
    final SharedPreferences prefs = await _prefs;
    var id = await prefs.getString('token');
    return id!;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet<dynamic>(
              useSafeArea: true,
              backgroundColor: Colors.white,
              showDragHandle: true,
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14, top: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: Icon(Icons.exit_to_app_rounded),
                            onTap: () => Get.back(),
                          ),
                          Obx(
                            () => Text(
                              localeController.locale.value == 'en'
                                  ? "Add A Post"
                                  : "இடுகையை உருவாக்கு",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize:
                                      localeController.locale.value == 'en'
                                          ? 24
                                          : 19,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.all(1),
                                backgroundColor: colors.pinkMain,
                                fixedSize: Size(40, 30)),
                            child: Obx(() => postController.isLoading.value
                                ? Center(
                                    child: CircularProgressIndicator(
                                        strokeWidth: 3, color: Colors.white),
                                  )
                                : Text(
                                    "Post",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white),
                                  )),
                            onPressed: () async {
                              if (!postController
                                  .contentcontroller.text.isEmpty) {
                                var res = await postController.createPost();
                                if (res) {
                                  if (!postController.isPosted.value) {
                                    print("Posted failed");

                                    Get.snackbar("Posted Failed",
                                        "Your Blog Is not Live");
                                    onrefresh();
                                    setState(() {});
                                  } else {
                                    print("Posted Success");
                                    Get.back();
                                    Get.snackbar(
                                      "Posted Successfully",
                                      colorText: Colors.white,
                                      backgroundColor: colors.pink,
                                      "Your Blog Is Live",
                                      margin: EdgeInsets.only(
                                          bottom: 20, left: 10, right: 10),
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                    onrefresh();
                                    setState(() {});
                                  }
                                }
                              } else {
                                Get.snackbar(
                                  "Empty Fields",
                                  "Fill the content!",
                                  snackPosition: SnackPosition.BOTTOM,
                                  colorText: Colors.white,
                                  backgroundColor: colors.pink,
                                  margin: EdgeInsets.only(
                                      bottom: 20, left: 10, right: 10),
                                );
                              }
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            child: Icon(Icons.person_2_rounded),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Obx(
                            () => Text(
                              localeController.locale.value == 'en'
                                  ? "What's On Your Mind ?"
                                  : "உங்கள் மனதில் என்ன உள்ளது?",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize:
                                      localeController.locale.value == 'en'
                                          ? 18
                                          : 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 18),
                      ConstrainedBox(
                        constraints: BoxConstraints(minHeight: 400),
                        child: Obx(
                          () => TextFormField(
                            maxLines: 16,
                            controller: postController.contentcontroller,
                            decoration: InputDecoration(
                              hintText: localeController.locale.value == "en"
                                  ? "Write your heart out..."
                                  : "உங்கள் இதயத்தை வெளிப்படுத்துவதாக எழுதுங்கள்...",
                              contentPadding: const EdgeInsets.all(10),
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: const Color(0xffE0E0E0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(9)),
                                  borderSide: BorderSide(
                                      color: const Color(0xffE0E0E0))),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: const Color(0xffE0E0E0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          child: Obx(() => !postController.isPosted.value
                              ? Text(
                                  "Your Post does not follow our commmunity guidelines !!",
                                  style: GoogleFonts.poppins(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                )
                              : SizedBox()),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
          backgroundColor: colors.pinkMain,
          child: Image.asset(
            "assets/pen.png",
            fit: BoxFit.contain,
            height: 24,
            color: Colors.white,
          )),
      body: Obx(
        () {
          if (getPostsController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return RefreshIndicator(
              onRefresh: onrefresh,
              child: SizedBox(
                child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: getPostsController.myModel.length,
                      itemBuilder: (context, index) {
                        // print(getPostsController.myModel[index].likes!.length
                        //     .toString());

                        // getPostsController.getPostById(
                        //     getPostsController.myModel[index].sId!);
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 14, right: 14, bottom: 10, top: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            // constraints: BoxConstraints(maxWidth: width * 0.5),

                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: getPostsController
                                                    .myModel[index].title !=
                                                "admin"
                                            ? Icon(Icons.person)
                                            : Image.asset("assets/seh.png"),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        getPostsController
                                            .myModel[index].author!,
                                        style: styleTitle,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      getPostsController.myModel[index].title ==
                                              "admin"
                                          ? Icon(
                                              Icons.verified,
                                              color: Colors.blue,
                                            )
                                          : SizedBox()
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    getPostsController.myModel[index].content!,
                                    style: styleContent,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  FutureBuilder(
                                    future: getPostByidController.getPostById(
                                        getPostsController.myModel[index].sId!),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        bool isLiked = false;

                                        for (var u in snapshot.data!.likes!) {
                                          if (u["name"] != getID()) {
                                            isLiked = true;
                                          }
                                        }
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            LikeButton(
                                                isLiked: isLiked,
                                                onTap: (isliked) async {
                                                  dolike(snapshot.data!.sId!);

                                                  // if (snapshot.hasData) {
                                                  //   isLiked = false;

                                                  //   for (var u in snapshot
                                                  //       .data!.likes!) {
                                                  //     if (u['name'] == getID()) {
                                                  //       print(u['name']);
                                                  //       isLiked = true;
                                                  //     }
                                                  //   }
                                                  // }
                                                  return isLiked;
                                                },
                                                likeBuilder: (bool isLiked) {
                                                  return !isLiked
                                                      ? SvgPicture.asset(
                                                          "assets/unlike.svg")
                                                      : SvgPicture.asset(
                                                          "assets/like.svg",
                                                          color: Colors.red,
                                                        );
                                                },
                                                likeCount: snapshot
                                                    .data!.likes!.length,
                                                circleColor: CircleColor(
                                                    start: colors.purpMain,
                                                    end: colors.purpMain),
                                                bubblesColor: BubblesColor(
                                                  dotPrimaryColor:
                                                      Color(0xff33b5e5),
                                                  dotSecondaryColor:
                                                      Color(0xff0099cc),
                                                )),

                                            // GestureDetector(
                                            //   onTap: () =>
                                            //       dolike(snapshot.data!.sId!),
                                            //   child: Column(
                                            //     crossAxisAlignment:
                                            //         CrossAxisAlignment.center,
                                            //     children: [

                                            //       Text(),
                                            //       Text(
                                            //         "Spark",
                                            //         style: styleContent,
                                            //       ),
                                            //     ],
                                            //   ),
                                            // ),
                                            // TextButton.icon(

                                            //     label:
                                            //     onPressed: () {},
                                            //     icon: Icon(
                                            //       Icons.thumb_up,
                                            //       size: 18,
                                            //     )),
                                            TextButton.icon(
                                                label: Obx(
                                                  () => Text(
                                                    localeController
                                                                .locale.value ==
                                                            'en'
                                                        ? "Comments"
                                                        : "கருத்துகள்",
                                                    style: styleContent,
                                                  ),
                                                ),
                                                style: TextButton.styleFrom(
                                                    foregroundColor:
                                                        colors.pink),
                                                onPressed: () {
                                                  showModalBottomSheet<dynamic>(
                                                      backgroundColor:
                                                          Colors.white,
                                                      useSafeArea: true,
                                                      isScrollControlled: true,
                                                      showDragHandle: true,
                                                      context: context,
                                                      builder: ((context) {
                                                        return StatefulBuilder(
                                                          builder: (context,
                                                                  setModalstate) =>
                                                              Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 0.0,
                                                                    left: 8,
                                                                    right: 8,
                                                                    bottom: 3),
                                                            child: Stack(
                                                              children: [
                                                                Column(
                                                                  children: [
                                                                    Obx(
                                                                      () =>
                                                                          Text(
                                                                        localeController.locale.value ==
                                                                                'en'
                                                                            ? "Comments"
                                                                            : "கருத்துகள்",
                                                                        style: GoogleFonts.poppins(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.w600),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                        color: Colors
                                                                            .white,
                                                                        constraints: BoxConstraints(
                                                                            minHeight:
                                                                                300,
                                                                            maxHeight: height *
                                                                                0.82),
                                                                        child:
                                                                            FutureBuilder(
                                                                          future: getPostByidController.getPostById(getPostsController
                                                                              .myModel[index]
                                                                              .sId!),
                                                                          builder:
                                                                              (context, snapshotCom) {
                                                                            if (snapshotCom.hasData) {
                                                                              return ListView.builder(
                                                                                itemCount: snapshotCom.data!.comments!.length,
                                                                                itemBuilder: (context, indexC) {
                                                                                  return ListTile(
                                                                                    leading: const CircleAvatar(
                                                                                      child: Icon(Icons.person),
                                                                                    ),
                                                                                    title: Text(snapshotCom.data!.comments![indexC]["name"]),
                                                                                    subtitle: Text(snapshotCom.data!.comments![indexC]["comment"]),
                                                                                  );
                                                                                },
                                                                              );
                                                                            } else {
                                                                              return Center(
                                                                                child: CircularProgressIndicator(),
                                                                              );
                                                                            }
                                                                          },
                                                                        )),
                                                                  ],
                                                                ),
                                                                Positioned(
                                                                  bottom: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets
                                                                      .bottom,
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                            color:
                                                                                Colors.white),
                                                                    child: Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        ConstrainedBox(
                                                                          constraints: BoxConstraints(
                                                                              maxHeight: 60,
                                                                              minHeight: 40,
                                                                              maxWidth: width * 0.75),
                                                                          child:
                                                                              Obx(
                                                                            () =>
                                                                                TextFormField(
                                                                              controller: likeCommentController.commentcontroller,
                                                                              decoration: InputDecoration(
                                                                                hintText: localeController.locale.value == 'en' ? "Comment Your Thoughts..." : "கருத்துகளை பதியுங்கள்...",
                                                                                hintStyle: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w300, color: const Color(0xffE0E0E0)),
                                                                                contentPadding: const EdgeInsets.all(10),
                                                                                enabledBorder: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(9)), borderSide: BorderSide(color: const Color(0xffE0E0E0))),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(color: const Color(0xffE0E0E0)),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              width * 0.10,
                                                                        ),
                                                                        IconButton(
                                                                            onPressed:
                                                                                () async {
                                                                              if (!likeCommentController.commentcontroller.text.isEmpty) {
                                                                                var resp = await likeCommentController.doComment(snapshot.data!.sId!);
                                                                                if (resp) {
                                                                                  if (!likeCommentController.isPosted.value) {
                                                                                    Get.snackbar("Community Violation", "Please follow our guidelines", backgroundColor: colors.pinkMain, colorText: Colors.white, snackPosition: SnackPosition.TOP, margin: EdgeInsets.only(top: 10, left: 8, right: 8));
                                                                                  }
                                                                                  // if (!likeCommentController.isPosted.value) {
                                                                                  //   likeCommentController.commentcontroller.clear();
                                                                                  // }
                                                                                }
                                                                                setModalstate(() {});
                                                                              }
                                                                            },
                                                                            icon:
                                                                                Icon(
                                                                              Icons.send,
                                                                              color: colors.pink,
                                                                            )),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets
                                                                      .bottom,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      }));
                                                },
                                                icon: const Icon(
                                                  Icons.comment,
                                                  size: 18,
                                                )),
                                            TextButton.icon(
                                                label: Text(
                                                  localeController
                                                              .locale.value ==
                                                          "en"
                                                      ? "Keep It"
                                                      : "சேமி",
                                                  style: styleContent,
                                                ),
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.bookmark,
                                                  size: 18,
                                                ))
                                          ],
                                        );
                                      } else {
                                        return SizedBox();
                                      }
                                    },
                                  ),

                                  // getPostsController.myModel[index].sId != Null
                                  //     ? FutureBuilder(
                                  //         future: getPostByidController
                                  //             .getPostById(getPostsController
                                  //                 .myModel[index].sId!),
                                  //         builder: (context, snapshot) {
                                  //           if (snapshot.hasData) {

                                  // } else {
                                  //   return Center(
                                  //     child:
                                  //         CircularProgressIndicator(),
                                  //   );
                                  //           }
                                  //         })
                                  //     : SizedBox()
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )),
              ),
            );
          }
        },
      ),
    ));
  }
}
