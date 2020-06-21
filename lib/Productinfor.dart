import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Productinfor extends StatelessWidget {
  Productinfor({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Transform.translate(
                offset: Offset(0.5, 0.0),
                child: Container(
                  width: 375.0,
                  height: 812.0,
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0.0, 44.0),
                child:
                    
                    Container(
                  width: 375.0,
                  height: 768.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.0),
                    color: const Color(0x6ef9f8f7),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0.0, 60.0),
                child:
                    
                    Stack(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(0.0, 551.0),
                      child:
                          
                          Stack(
                        children: <Widget>[
                          
                          Container(
                            width: 375.0,
                            height: 201.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(44.0),
                              ),
                              color: const Color(0xff365eff),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x1a000000),
                                  offset: Offset(8, 16),
                                  blurRadius: 32,
                                ),
                              ],
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(133.0, 124.0),
                            child:
                                
                                Text(
                              'Add to card',
                              style: TextStyle(
                                fontFamily: 'Montserrat-Bold',
                                fontSize: 18,
                                color: const Color(0xffffffff),
                                height: 1.3333333333333333,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0.0, 163.0),
                      child:
                          
                          Container(
                        width: 375.0,
                        height: 489.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(44.0),
                            bottomRight: Radius.circular(11.0),
                            bottomLeft: Radius.circular(44.0),
                          ),
                          color: const Color(0xffedf0ff),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(32.0, 584.0),
                      child:
                          
                          Stack(
                        children: <Widget>[
                          Transform.translate(
                            offset: Offset(167.0, 0.0),
                            child:
                                
                                Stack(
                              children: <Widget>[
                                
                                Container(
                                  width: 44.0,
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(22.0, 22.0)),
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                                Transform.translate(
                                  offset: Offset(14.0, 21.0),
                                  child:
                                      
                                      Stack(
                                    children: <Widget>[
                                      
                                      Container(
                                        width: 16.0,
                                        height: 2.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(1.0),
                                          color: const Color(0xff365eff),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(267.0, 0.0),
                            child:
                                
                                Stack(
                              children: <Widget>[
                                
                                Container(
                                  width: 44.0,
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(22.0, 22.0)),
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                                Transform.translate(
                                  offset: Offset(14.0, 14.0),
                                  child:
                                      
                                      Stack(
                                    children: <Widget>[
                                      Transform.translate(
                                        offset: Offset(0.0, 7.0),
                                        child:
                                            
                                            Container(
                                          width: 16.0,
                                          height: 2.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(1.0),
                                            color: const Color(0xff365eff),
                                          ),
                                        ),
                                      ),
                                      Transform(
                                        transform: Matrix4(
                                            0.0,
                                            1.0,
                                            0.0,
                                            0.0,
                                            -1.0,
                                            0.0,
                                            0.0,
                                            0.0,
                                            0.0,
                                            0.0,
                                            1.0,
                                            0.0,
                                            9.0,
                                            0.0,
                                            0.0,
                                            1.0),
                                        child:
                                            
                                            Container(
                                          width: 16.0,
                                          height: 2.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(1.0),
                                            color: const Color(0xff365eff),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(0.0, 11.0),
                            child:
                                
                                Text(
                              'Quality',
                              style: TextStyle(
                                fontFamily: 'Montserrat-Medium',
                                fontSize: 18,
                                color: const Color(0xff656565),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(235.0, 11.0),
                            child:
                                
                                Text(
                              '1',
                              style: TextStyle(
                                fontFamily: 'Montserrat-Bold',
                                fontSize: 18,
                                color: const Color(0xff656565),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    Container(
                      width: 375.0,
                      height: 560.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(44.0),
                          topRight: Radius.circular(44.0),
                          bottomRight: Radius.circular(11.0),
                          bottomLeft: Radius.circular(44.0),
                        ),
                        color: const Color(0xfffcf9f7),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x1a000000),
                            offset: Offset(8, -16),
                            blurRadius: 32,
                          ),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(32.0, 449.0),
                      child:
                          
                          SizedBox(
                        width: 215.0,
                        height: 54.0,
                        child: Text(
                          'Fresh hamburger with chicken, salad, tomatoes a little soy sauce makes a different taste.',
                          style: TextStyle(
                            fontFamily: 'Montserrat-Regular',
                            fontSize: 12,
                            color: const Color(0xff656565),
                            height: 1.5,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(32.0, 373.0),
                      child:
                          
                          Text(
                        'Rs 30.00',
                        style: TextStyle(
                          fontFamily: 'Montserrat-SemiBold',
                          fontSize: 24,
                          color: const Color(0xff365eff),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(32.0, 407.0),
                      child:
                          
                          Text(
                        'Chicken burger',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 24,
                          color: const Color(0xff373737),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(65.0, 80.0),
                      child:
                          
                          Stack(
                        children: <Widget>[
                          
                          Container(
                            width: 245.0,
                            height: 245.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(122.5, 122.5)),
                              color: const Color(0xffd8d8d8),
                            ),
                          ),
                          
                          Stack(
                            children: <Widget>[
                              Transform.translate(
                                offset: Offset(-67.0, -103.0),
                                child:
                                    
                                    Container(
                                  width: 393.0,
                                  height: 393.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: const AssetImage(''),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              
                              Container(
                                width: 245.0,
                                height: 245.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(122.5, 122.5)),
                                  color: const Color(0xffd8d8d8),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(152.0, 179.0),
                      child:
                          
                          Stack(
                        children: <Widget>[
                          
                          Container(
                            width: 72.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100.0),
                                topRight: Radius.circular(32.0),
                                bottomRight: Radius.circular(100.0),
                                bottomLeft: Radius.circular(32.0),
                              ),
                              color: const Color(0x99373737),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(24.0, 12.0),
                            child:
                                
                                Stack(
                              children: <Widget>[
                                
                                SvgPicture.string(
                                  _svg_khr0j7,
                                  allowDrawingOutsideViewBox: true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(176.0, 8.0),
                      child:
                          
                          Container(
                        width: 24.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.5),
                          color: const Color(0xff365eff),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

const String _svg_khr0j7 =
    '<svg viewBox="0.0 0.0 24.0 24.0" ><path  d="M 0 0 L 24 0 L 24 24 L 0 24 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(7.87, 4.0)" d="M 9.778535842895508 8.493793487548828 C 9.918789863586426 8.375452041625977 9.999500274658203 8.204324722290039 9.999995231628418 8.024245262145996 C 10.00049018859863 7.844165325164795 9.920721054077148 7.672625541687012 9.781119346618652 7.553563594818115 L 1.072293400764465 0.1555073708295822 C 0.8816385865211487 -0.006591226439923048 0.6105725169181824 -0.045630794018507 0.3794079720973969 0.05571639910340309 C 0.1482434570789337 0.1570635885000229 -0.0001858084578998387 0.3800183832645416 6.267201229093189e-07 0.6256221532821655 L 6.267201229093189e-07 15.37422275543213 C -0.0002484316355548799 15.619553565979 0.1477976590394974 15.8423490524292 0.3785530030727386 15.94390869140625 C 0.6093083024024963 16.04546737670898 0.8801144361495972 16.00701522827148 1.071001529693604 15.84558868408203 L 9.778535842895508 8.493793487548828 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
