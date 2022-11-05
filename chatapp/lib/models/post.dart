import 'dart:convert';
import 'package:flutter/foundation.dart';

class Post {
  final String username;
  final String profileImageUrl;
  final String postMediaUrl;
  final String postCaption;
  final int commentCount;
  final DateTime postCreationDate;

  Post({
    required this.username,
    required this.profileImageUrl,
    required this.postMediaUrl,
    required this.postCaption,
    required this.commentCount,
    required this.postCreationDate,
  });

  Post copyWith({
    required String username,
    required String profileImageUrl,
    required String postMediaUrl,
    required String postCaption,
    required int commentCount,
    required DateTime postCreationDate,
  }) {
    return Post(
      username: username,
      profileImageUrl: profileImageUrl,
      postMediaUrl: postMediaUrl,
      postCaption: postCaption,
      commentCount: commentCount,
      postCreationDate: postCreationDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'profileImageUrl': profileImageUrl,
      'postMediaUrl': postMediaUrl,
      'postCaption': postCaption,
      'commentCount': commentCount,
      'postCreationDate': postCreationDate.millisecondsSinceEpoch,
    };
  }

  static Post? fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Post(
      username: map['username'],
      profileImageUrl: map['profileImageUrl'],
      postMediaUrl: map['postMediaUrl'],
      postCaption: map['postCaption'],
      commentCount: map['commentCount'],
      postCreationDate:
          DateTime.fromMillisecondsSinceEpoch(map['postCreationDate']),
    );
  }

  String toJson() => json.encode(toMap());

  static Post? fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(username: $username, profileImageUrl: $profileImageUrl, postMediaUrl: $postMediaUrl, postCaption: $postCaption, commentCount: $commentCount, postCreationDate: $postCreationDate)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Post &&
        o.username == username &&
        o.profileImageUrl == profileImageUrl &&
        o.postMediaUrl == postMediaUrl &&
        o.postCaption == postCaption &&
        o.commentCount == commentCount &&
        o.postCreationDate == postCreationDate;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        profileImageUrl.hashCode ^
        postMediaUrl.hashCode ^
        postCaption.hashCode ^
        commentCount.hashCode ^
        postCreationDate.hashCode;
  }
}
