import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {

  Home(this.currlocdata);
  final currlocdata;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  int temp=0;
  int press=0;
  String status='';
  int humid=0;
  int wind=10;
  String cityname='';
  @override
  void initState(){
    super.initState();
    initialz(widget.currlocdata);
  }


  void initialz(dynamic weatherdata){
    double ttemp=weatherdata['main']['temp'];
    temp=ttemp.toInt();
    press=weatherdata['main']['pressure'];
    humid=weatherdata['main']['humidity'];
    status=weatherdata['weather'][0]['main'];
    cityname=weatherdata['name'];
    double wwind=weatherdata['wind']['speed'];
    wind=wwind.toInt();

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          titleSpacing: -10,
        //leadingWidth: 37,

        title: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search Any Place',
          ),
          textInputAction: TextInputAction.go,
        ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
    onPressed: () {},
    icon: Icon(
    Icons.search,
    size: 25,

    color: Colors.white,
    ),
    )
        ),
        body:Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/sunny.jpg'),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.6), BlendMode.dstATop),
      ),
    ),
  constraints: BoxConstraints.expand(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                   height: 150,
                   ),


                    Text('$cityname',
                      style: GoogleFonts.lato(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,

                      ),
                    ),

             SizedBox(
              height: 250,
              ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('$temp°',
                        style: GoogleFonts.lato(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                      Text('Clear°',
                        style: GoogleFonts.lato(
                          fontSize:20,
                          // fontWeight: FontWeight.bold,

                        ),
                      ),


                    ],
                  ),

                 
                 
                  Column(
                    children: [
                      SizedBox(
                        height: 25,
                        width: double.infinity,
                        child: Divider(
                          thickness: 1.2,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [

                                Text(
                                  'Wind',
                                  style: GoogleFonts.lato(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  '$wind',
                                  style: GoogleFonts.lato(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  'Kmph',
                                  style: GoogleFonts.lato(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold
                                  ),
                                )

                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'HUMIDITY',
                                  style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  '$humid',
                                  style: GoogleFonts.lato(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  'gm/m^3',
                                  style: GoogleFonts.lato(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'PRESSURE',
                                  style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  '$press',
                                  style: GoogleFonts.lato(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  'Pascal',
                                  style: GoogleFonts.lato(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  )


                ],
              ),
            ),
          ),
    ),

    );
  }
}
