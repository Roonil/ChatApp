import 'package:flutter/material.dart';
import 'package:chatapp/common/utils.dart';
import 'package:chatapp/models/post.dart';
import 'package:chatapp/widgets/post_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedScreen extends StatelessWidget {
  final Future<List<Post>> futureListOfPost;
  const FeedScreen({
    Key? key,
    required this.futureListOfPost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PostAppBar(
        height: 65,
        center: Text(
          'Posts',
          style: GoogleFonts.cookie(
            color: Colors.white,
            fontSize: 36,
          ),
        ),
      ),
      body: Container(
        height: screen.height,
        width: screen.width,
        color: Theme.of(context).primaryColorDark,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (context, index) {
            return Container(
              child: FutureBuilder(
                future: futureListOfPost,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Object? _postList = snapshot.data;
                  }
                  return CircularProgressIndicator();
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _postWidget({required Post post}) {
    return Container(
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(post.profileImageUrl),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          post.username,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Image(
                image: NetworkImage(post.postMediaUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: post.username,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: ' ${post.postCaption}',
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'View all ${post.commentCount} comments',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                    Text(
                      '${Utils.getTimeDifference(post.postCreationDate)}',
                      style: TextStyle(color: Colors.grey[500]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
