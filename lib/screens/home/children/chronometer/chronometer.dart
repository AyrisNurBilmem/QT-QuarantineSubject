import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sampleproject/constants.dart';
import 'package:sampleproject/screens/home/children/leave_quarantine/leave_quarantine.dart';
import 'package:waveprogressbar_flutter/waveprogressbar_flutter.dart';

class ChronometerScreen extends StatefulWidget {
  const ChronometerScreen({Key? key}) : super(key: key);

  @override
  State<ChronometerScreen> createState() => _ChronometerScreenState();
}

class _ChronometerScreenState extends State<ChronometerScreen> {
  void initState() {
    super.initState();
  }

  @override
  WaterController _waterController = WaterController();
  double _waveHeight = 0.0;

  Color buttonColor(difference) {
    if (difference == 1 || difference == 0) {
      return primaryColor;
    } else {
      return Color.fromARGB(255, 192, 188, 188);
    }
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isButtonActive = false;
    final today = DateTime.now();
    //final fourteenDaysFromNow = today.add(const Duration(days: 14));
    final difference = 1;
    WidgetsBinding _widgetsBinding = WidgetsBinding.instance;
    _widgetsBinding.addPostFrameCallback((timeStamp) {
      _waterController
          .changeWaterHeight((((100 * (14 - difference)) / 14) / 100));
    });

    return Scaffold(
      body: SafeArea(
        child: Container(
            width: double.infinity,
            height: size.height,
            child: Column(
              children: [
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    "HOME",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: size.height * 0.1),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    WaveProgressBar(
                      size: Size(240.0, 240.0),
                      waterColor: primaryLightColor,
                      flowSpeed: 0.1,
                      percentage: _waveHeight,
                      heightController: _waterController,
                      textStyle: TextStyle(fontSize: 0),
                    ),
                    Container(
                      child: CircularPercentIndicator(
                        radius: 120.0,
                        lineWidth: 10.0,
                        percent: ((100 * (14 - difference)) / 14) / 100,
                        animation: true,
                        animationDuration: 1500,
                        center: Text(
                          '${difference} Days\n Left',
                          style: TextStyle(fontSize: 30),
                        ),
                        progressColor: primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.15),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        primary: buttonColor(difference),
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                        textStyle:
                            TextStyle(color: Colors.black, fontSize: 18)),
                    child: Text("Leave"),
                    onPressed: () {
                      if (difference == 0 || difference == 1) {
                        setState(() {
                          isButtonActive = true;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LeaveQuarantineScreen();
                            },
                          ),
                        );
                      } else {
                        null;
                      }
                    })
              ],
            )),
      ),
    );
  }
}
