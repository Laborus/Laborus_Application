import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // homescreenfirstvisit9h4 (1:63)
        padding: EdgeInsets.fromLTRB(0 * fem, 1 * fem, 0 * fem, 0 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfffafafc),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogrouphxxq8xJ (cKKaXbHhKS24tuLDDhXXQ)
              padding:
                  EdgeInsets.fromLTRB(20 * fem, 27 * fem, 20 * fem, 10 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // configuraesdeA (1:70)
                    margin: EdgeInsets.fromLTRB(
                        2 * fem, 0 * fem, 0 * fem, 41 * fem),
                    child: Text(
                      'CONFIGURAÇÕES',
                      style: TextStyle(
                        fontSize: 24 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2225188141 * ffem / fem,
                        color: Color(0xff1e1e1e),
                      ),
                    ),
                  ),
                  Container(
                    // line16eJN (1:68)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 10 * fem),
                    width: double.infinity,
                    height: 1 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xfff2f5f9),
                    ),
                  ),
                  Container(
                    // autogroupqbrryLe (cKKoc3qFN2CDiK49eQBrr)
                    margin: EdgeInsets.fromLTRB(
                        2 * fem, 0 * fem, 127 * fem, 0 * fem),
                    width: double.infinity,
                    height: 40 * fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // perfilVJz (I1:65;631:5097)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 21 * fem, 0 * fem),
                          width: 40 * fem,
                          height: 40 * fem,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20 * fem),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/page-1/images/perfil-bg.png',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // autogroupi8xcydU (cKKu24UhC1ZnYkmA1i8XC)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 3 * fem, 0 * fem, 2 * fem),
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // antonamartinezgnn (1:66)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 3 * fem),
                                child: Text(
                                  'Antonía Martinez',
                                  style: TextStyle(
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.2000000817 * ffem / fem,
                                    color: Color(0xff1e1e1e),
                                  ),
                                ),
                              ),
                              Text(
                                // antonamagmailcomwyc (1:67)
                                'Antonía.ma@gmail.com',
                                style: TextStyle(
                                  fontSize: 12 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2000000477 * ffem / fem,
                                  color: Color(0xff575a5e),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // line17Rtn (1:69)
              margin: EdgeInsets.fromLTRB(
                  20 * fem, 0 * fem, 20 * fem, 409.39 * fem),
              width: double.infinity,
              height: 1 * fem,
              decoration: BoxDecoration(
                color: Color(0xfff2f5f9),
              ),
            ),
            Container(
              // group110jea (I1:71;682:1096)
              width: double.infinity,
              height: 69.61 * fem,
              child: Stack(
                children: [
                  Positioned(
                    // group106sEz (I1:71;682:1096;630:966)
                    left: 0 * fem,
                    top: 13.4736785889 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 360 * fem,
                        height: 56.14 * fem,
                        child: Image.asset(
                          'assets/page-1/images/group-106.png',
                          width: 360 * fem,
                          height: 56.14 * fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // group64y38 (I1:71;682:1096;630:969)
                    left: 231.75 * fem,
                    top: 26.9473571777 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 20.41 * fem,
                        height: 20.3 * fem,
                        child: Image.asset(
                          'assets/page-1/images/group-64.png',
                          width: 20.41 * fem,
                          height: 20.3 * fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // homes8W (I1:71;682:1096;630:975)
                    left: 37 * fem,
                    top: 49.403503418 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 23 * fem,
                        height: 10 * fem,
                        child: Text(
                          'Home',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 8 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.2125 * ffem / fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // group109krW (I1:71;682:1096;630:1093)
                    left: 96.625 * fem,
                    top: 25.8245544434 * fem,
                    child: Container(
                      width: 24 * fem,
                      height: 33.58 * fem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // vectorr8r (I1:71;682:1096;630:974)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0.25 * fem, 3.37 * fem),
                            width: 22.5 * fem,
                            height: 20.21 * fem,
                            child: Image.asset(
                              'assets/page-1/images/vector-3PQ.png',
                              width: 22.5 * fem,
                              height: 20.21 * fem,
                            ),
                          ),
                          Container(
                            // vagas8cA (I1:71;682:1096;630:976)
                            width: double.infinity,
                            child: Text(
                              'Vagas',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 8 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.2125 * ffem / fem,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // conversasEQJ (I1:71;682:1096;630:977)
                    left: 221 * fem,
                    top: 49.403503418 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 42 * fem,
                        height: 10 * fem,
                        child: Text(
                          'Conversas',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 8 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.2125 * ffem / fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // config6xJ (I1:71;682:1096;630:978)
                    left: 290.625 * fem,
                    top: 49.403503418 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 57 * fem,
                        height: 10 * fem,
                        child: Text(
                          'Configurações',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 8 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.2125 * ffem / fem,
                            color: Color(0xff9d35f2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // vectorDQe (I1:71;682:1096;630:2265)
                    left: 308.25 * fem,
                    top: 25.8245544434 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 20.25 * fem,
                        height: 20.21 * fem,
                        child: Image.asset(
                          'assets/page-1/images/vector-z1g.png',
                          width: 20.25 * fem,
                          height: 20.21 * fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // vectorXw8 (I1:71;682:1096;630:2637)
                    left: 39.375 * fem,
                    top: 25.8245544434 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 18 * fem,
                        height: 19.65 * fem,
                        child: Image.asset(
                          'assets/page-1/images/vector.png',
                          width: 18 * fem,
                          height: 19.65 * fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // ellipse754AN (I1:71;682:1096;630:1091)
                    left: 154.125 * fem,
                    top: 0 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 45 * fem,
                        height: 44.91 * fem,
                        child: Image.asset(
                          'assets/page-1/images/ellipse-75.png',
                          width: 45 * fem,
                          height: 44.91 * fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // vectorX3x (I1:71;682:1096;630:1090)
                    left: 165.375 * fem,
                    top: 11.2280578613 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 22.5 * fem,
                        height: 22.46 * fem,
                        child: Image.asset(
                          'assets/page-1/images/vector-D6r.png',
                          width: 22.5 * fem,
                          height: 22.46 * fem,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
