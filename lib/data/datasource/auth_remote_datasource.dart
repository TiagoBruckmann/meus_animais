// imports globais
import 'package:meus_animais/session.dart';
import 'dart:convert';

// import dos data
import 'package:meus_animais/data/exceptions/exceptions.dart';
import 'package:meus_animais/data/models/user_model.dart';

// import dos pacotess
import 'package:firebase_performance/firebase_performance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDatasource {

  Future<bool> verifyConnection();

}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  AuthRemoteDatasourceImpl();

  @override
  Future<bool> verifyConnection() async {
    return false;
  }

}