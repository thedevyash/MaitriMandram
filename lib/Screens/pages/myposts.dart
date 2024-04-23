import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sehyogini_frontned/controllers/getUserById.dart';

class MyPosts extends StatefulWidget {
  GetUserByIdController controller;
  MyPosts({super.key, required this.controller});

  @override
  State<MyPosts> createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Posts",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.controller.myUser.value.myposts!.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(color: Colors.grey[100]),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.person_2_rounded),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.controller.myUser.value.name!,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.controller.myUser.value.myposts![index]["content"],
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              widget.controller.myUser.value
                                  .myposts![index]["likes"].length
                                  .toString(),
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: 14),
                            ),
                            Text(
                              "Likes",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: 14),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet<dynamic>(
                              backgroundColor: Colors.white,
                              useSafeArea: true,
                              isScrollControlled: true,
                              showDragHandle: true,
                              context: context,
                              builder: (context) {
                                return widget
                                            .controller
                                            .myUser
                                            .value
                                            .myposts![index]["comments"]
                                            .length !=
                                        0
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: widget
                                            .controller
                                            .myUser
                                            .value
                                            .myposts![index]["comments"]
                                            .length,
                                        itemBuilder: (context, indexC) {
                                          return ListTile(
                                            leading: const CircleAvatar(
                                              child: Icon(Icons.person),
                                            ),
                                            title: Text(widget.controller.myUser
                                                    .value.myposts![index]
                                                ["comments"][indexC]["name"]),
                                            subtitle: Text(widget
                                                    .controller
                                                    .myUser
                                                    .value
                                                    .myposts![index]["comments"]
                                                [indexC]["comment"]),
                                          );
                                        },
                                      )
                                    : Center(
                                        child: Text(
                                          "No Comments",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14),
                                        ),
                                      );
                              },
                            );
                          },
                          child: Column(
                            children: [
                              Text(
                                widget.controller.myUser.value
                                    .myposts![index]["comments"].length
                                    .toString(),
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400, fontSize: 14),
                              ),
                              Text(
                                "Comments",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400, fontSize: 14),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
