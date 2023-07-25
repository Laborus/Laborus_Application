// ignore_for_file: unused_local_variable

import 'dart:developer';

import 'package:laborus_app/utils/constants.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase{
  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    //print(status);
    final students = db.collection(STUDENT_COLLECTION);

    await students.insertOne({
      "name" : "usuario1",
      "email" : "usuario1@gmail.com",
    });

    //print(await students.find().toList());

    final school = db.collection(SCHOOL_COLLECTION);
    final company = db.collection(COMPANY_COLLECTION);
    final post = db.collection(POST_COLLECTION);
    final jobs = db.collection(JOBS_COLLECTION);
    final challenge = db.collection(CHALLENGE_COLLECTION);
    final field = db.collection(FIELD_COLLECTION);
    final notification = db.collection(NOTIFICATION_COLLECTION);
    final comments = db.collection(COMMENTS_COLLECTION);

  }
}