import 'package:flutter/material.dart';

const bgColor = Color(0xff1f1f1f);
const cardColorYellow = Color(0xfffef754);
const cardColorPurple = Color(0xff9c6bce);
const cardColorGreen = Color(0xffbcee4b);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: UpmostPart(),
              ),
              SizedBox(
                height: 20,
              ),
              ScheduleCard(
                bgColor: cardColorYellow,
                startHour: 11,
                startMinute: 30,
                endHour: 12,
                endMinute: 20,
                upperContents: 'DESIGN',
                lowerContents: 'MEETING',
                persionlist: 1,
              ),
              SizedBox(
                height: 5,
              ),
              ScheduleCard(
                  bgColor: cardColorPurple,
                  startHour: 12,
                  startMinute: 35,
                  endHour: 14,
                  endMinute: 10,
                  upperContents: 'DAILY',
                  lowerContents: 'PROJECT',
                  persionlist: 2),
              SizedBox(
                height: 5,
              ),
              ScheduleCard(
                  bgColor: cardColorGreen,
                  startHour: 15,
                  startMinute: 0,
                  endHour: 16,
                  endMinute: 30,
                  upperContents: 'WEEKLY',
                  lowerContents: 'PLANNING',
                  persionlist: 3),
            ],
          )),
        ),
      ),
    );
  }
}

class UpmostPart extends StatelessWidget {
  const UpmostPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Image.asset(
            'assets/ui_clone.png',
            height: 40,
          ),
          const Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          )
        ]),
        const SizedBox(
          height: 18,
        ),
        const Text(
          'MONDAY 16',
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white54),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'TODAY',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.9)),
            ),
            const SizedBox(
              width: 4,
            ),
            const Icon(
              Icons.circle,
              size: 8,
              color: Color(0xffb12680),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              '17 18 19 2',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ],
        ),
      ],
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final Color bgColor;
  final int startHour, startMinute, endHour, endMinute;
  final String upperContents, lowerContents;
  // final List<String> persons;
  final int persionlist;

  const ScheduleCard(
      {super.key,
      required this.bgColor,
      required this.startHour,
      required this.startMinute,
      required this.endHour,
      required this.endMinute,
      required this.upperContents,
      required this.lowerContents,
      required this.persionlist});

  @override
  Widget build(BuildContext context) {
    const TextStyle timeStyleHour =
        TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
    const TextStyle timeStyleMinute =
        TextStyle(fontSize: 12, fontWeight: FontWeight.w400);

    const TextStyle contentsTextStyle =
        TextStyle(fontSize: 45, fontWeight: FontWeight.w500, height: 0.8);

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 3),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            // const SizedBox(
            //   height: 1,
            // ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        startHour.toString(),
                        style: timeStyleHour,
                      ),
                      Text(
                        startMinute.toString(),
                        style: timeStyleMinute,
                      ),
                      // const Icon(Icons.vertical_align_bottom),
                      // const Text('|',style: TextStyle(fontSize: ),),
                      const SizedBox(
                        height: 20,
                        child: VerticalDivider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                      ),
                      Text(
                        endHour.toString(),
                        style: timeStyleHour,
                      ),
                      Text(
                        endMinute.toString(),
                        style: timeStyleMinute,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        upperContents,
                        style: contentsTextStyle,
                      ),
                      Text(
                        lowerContents,
                        style: contentsTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 50,
                ),
                if (persionlist == 1)
                  AlexRow()
                else if (persionlist == 2)
                  MeRow()
                else
                  DenRow(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget AlexRow() {
    final style = TextStyle(
        color: Colors.black.withOpacity(0.4), fontWeight: FontWeight.w600);
    return Row(children: [
      Text(
        'ALEX',
        style: style,
      ),
      const SizedBox(
        width: 16,
      ),
      Text('HELENA', style: style),
      const SizedBox(
        width: 16,
      ),
      Text(
        'NANA',
        style: style,
      )
    ]);
  }

  Widget MeRow() {
    final style = TextStyle(
        color: Colors.black.withOpacity(0.4), fontWeight: FontWeight.w600);
    return Row(children: [
      const Text(
        'ME',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      const SizedBox(
        width: 16,
      ),
      Text('RICHARDO', style: style),
      const SizedBox(
        width: 16,
      ),
      Text('CIRY', style: style),
      const SizedBox(
        width: 16,
      ),
      Text('+4', style: style)
    ]);
  }

  Widget DenRow() {
    final style = TextStyle(
        color: Colors.black.withOpacity(0.4), fontWeight: FontWeight.w600);
    return Row(children: [
      Text('DEN', style: style),
      const SizedBox(
        width: 16,
      ),
      Text('NANA', style: style),
      const SizedBox(
        width: 16,
      ),
      Text(
        'MARK',
        style: style,
      )
    ]);
  }
}
