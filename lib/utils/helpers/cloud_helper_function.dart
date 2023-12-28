import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Helper function for cloud related operations
class DCloudHelperFunctions {

  static Widget? checkSingleRecordState<T>(AsyncSnapshot<T> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting){
      return const Center(child: CircularProgressIndicator());
    }

    if(!snapshot.hasData || snapshot.data == null) {
      return const Center(child: Text('No Data Found'));
    }

    if(snapshot.hasError) {
      return const Center(child: Text('Something went wrong'));
    }
    return null;
  }

  /// Multi Record state
  static Widget? checkMultiRecordState<T>({required AsyncSnapshot<List<T>> snapshot, Widget? loader, Widget? error, Widget? nothingFound}) {
    if (snapshot.connectionState == ConnectionState.waiting){
      if (loader!=null) return loader;
      return const Center(child: CircularProgressIndicator());
    }

    if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
      if(nothingFound !=null) return nothingFound;
      return const Center(child: Text('No Data Found'));
    }

    if(snapshot.hasError) {
      if (error !=null) return error;
      return const Center(child: Text('Something went wrong'));
    }
    return null;
  }
}