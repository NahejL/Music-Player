import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'futurefiles.dart';

/**
 * Structure:
 *  - static? List < Audio Container >
 *  - List < Audio Handle >
 *  - List < Mod >
 *  - List < Playlist >
 *  - List? < Player >
 * 
 * 
 */
void main() {
  runApp( ReloadClass() );
}

class ReloadClass extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SizedBox.expand( 
          child: DecoratedBox(
            child: FutureFiles(),
            decoration: BoxDecoration(
              color: Color( 0xFF000000 + ( 0x11 ~/ 2 * 0x100 ) + ( 0x22 ~/ 2 ) )
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: ((){ 

              const icon_width = 24.0;
              const padding_horizontal = 8.0;              

              Widget icon( IconData icon ){

                return Padding( 
                  child: Icon( 
                    icon, 
                    color: Color( 0xFFEEEEEE ),  
                    size: icon_width,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: padding_horizontal, vertical: 8
                  ),
                );

              }
            
              return [
                icon( Icons.fast_rewind ),
                icon( Icons.arrow_back_ios ),
                SizedBox( width: icon_width + 2 * padding_horizontal ),
                icon( Icons.arrow_forward_ios )
              ];
            }()),
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
          ),
          shape: CircularNotchedRectangle(),
          color: Color( 0xFF001122 ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon( 
            Icons.play_arrow,
            color: Color( 0xFFEEEEEE ),
          ),
          backgroundColor: Color( 0xFF88FF88 ),
          onPressed: () {
            // default state: new random player on this device
          },
        ),
        floatingActionButtonLocation: QuarterDockedFabLocation(),
        extendBody: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuarterDockedFabLocation extends StandardFabLocation with FabDockedOffsetY {
  const QuarterDockedFabLocation();
  /// Calculates x-offset for center-aligned [FloatingActionButtonLocation]s.
  @override
  double getOffsetX(ScaffoldPrelayoutGeometry scaffoldGeometry, double adjustment) {

    // so bad at math
    return (scaffoldGeometry.scaffoldSize.width - scaffoldGeometry.floatingActionButtonSize.width) * .65 ;
  
  }

  @override
  String toString() => 'QuarterDockedFabLocation';
}

// does not work properly
extension ColorOperators on Color {

  operator + ( Color color ) {

    this.withAlpha( this.alpha + color.alpha );
    this.withRed( this.red + color.red );
    this.withGreen( this.green + color.green );
    this.withBlue( this.blue + color.blue );

  }
  
  operator - ( Color color ) {

    this.withAlpha( this.alpha - color.alpha );
    this.withRed( this.red - color.red );
    this.withGreen( this.green - color.green );
    this.withBlue( this.blue - color.blue );

  }

  operator / ( int i ) {
    // depends on blend mode; blend mode could be a property if this extended Color
    //this.withAlpha( this.alpha + color.alpha );
    this.withRed( this.red ~/ i );
    this.withGreen( this.green ~/ i );
    this.withBlue( this.blue ~/ i );

  }
  
  operator * ( int i ) {
    // depends on blend mode; blend mode could be a property if this extended Color
    //this.withAlpha( this.alpha + color.alpha );
    this.withRed( this.red * i );
    this.withGreen( this.green * i );
    this.withBlue( this.blue * i );

  }

}


