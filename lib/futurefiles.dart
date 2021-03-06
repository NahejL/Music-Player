

import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FutureFiles extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    
    return FutureFilesState();
  }

}

class FutureFilesState extends State<FutureFiles> {

  final Future<Directory?> directoryFuture = getExternalStorageDirectory();
  late Future<Stream<FileSystemEntity>?>? filesFuture = directoryFuture.then<Stream<FileSystemEntity>?>( ( Directory? directory ) => directory?.list() );

  @override
  Widget build(BuildContext context) {
    

    return  FutureBuilder<List>(
      builder: ( BuildContext context, AsyncSnapshot<List<dynamic>?> snapshot ) {
        
        return snapshot.connectionState == ConnectionState.waiting 
        ? CircularProgressIndicator(
          backgroundColor: Color( 0xFF88FF88 ),
        )
        : ListView(
          children: snapshot.data!.map( (e) => Text( '' ) ).toList(),
        );
      },
      future: (() async {

        log( 'getting files' );

        log( 'directory :' + (await directoryFuture)!.path );

        log( 'files :' + await (await filesFuture)!.join( ', ' ) );

        return [

        ];
      })(),
      initialData: null,
    );
    
  }

}
