import 'package:first_project/question_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Question> questionList = getQuestion();

  int currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 246, 246, 1),
      body: Container(
        height: height,
        width: width,
        child: Wrap(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 30, left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Image(
                            image: AssetImage(
                              'assets/edu3.jpeg',
                            ),
                            height: 80,
                            width: 80,
                          ),
                        ),

                        //Record Button
                        ElevatedButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            fixedSize: Size(180, 30),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            side: BorderSide(
                              color: Colors.blueGrey,
                              width: 2,
                            ),
                            backgroundColor: Color.fromRGBO(243, 246, 246, 1),
                          ),
                          child: Text(
                            "Record their answer",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.blueGrey),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Grow closer to your loved ones\n by asking them this question",
                    style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  //Question Box
                  Container(
                    height: height / 2,
                    width: width / 2,
                    child: Column(
                      children: [
                        questionWidget(),

                        SizedBox(
                          height: 30,
                        ),

                        //Two button under the question box

                        Wrap(
                          children: [
                            //Copy button
                            Container(
                              height: 30,
                              width: 200,
                              child: ElevatedButton(
                                onPressed: () {
                                  //Alert Dailog
                                  Clipboard.setData(ClipboardData(
                                      text: questionList[currentQuestionIndex]
                                          .questionText));
                                  showToast("Copied!");
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          child: Container(
                                            height: height / 2,
                                            width: width / 2,
                                            margin: EdgeInsets.all(40),
                                            child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: Row(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        "Download the best 100 Questions",
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .blueGrey),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                          "We'd love to send you an E-book of the\n 100 top questions you can ask your\n loved ones to get to know them better.",
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .blueGrey)),
                                                      SizedBox(
                                                        height: 30,
                                                      ),
                                                      Container(
                                                        height: 35,
                                                        width: 280,
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                              labelText:
                                                                  "Email",
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30))),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      ElevatedButton(
                                                          onPressed: () {},
                                                          style: TextButton
                                                              .styleFrom(
                                                            fixedSize:
                                                                Size(180, 30),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            side: BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 2),
                                                            backgroundColor:
                                                                Colors.blueGrey,
                                                          ),
                                                          child: Text(
                                                              "Get the E-Book",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white))),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: Image(
                                                      image: AssetImage(
                                                        "assets/dialog.jpeg",
                                                      ),
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                },
                                style: TextButton.styleFrom(
                                  fixedSize: Size(180, 30),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  backgroundColor: Colors.blueGrey,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.copy_outlined,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                    Text("Copy this question",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: Colors.white)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),

                            //Try another button

                            _nextButton(),
                          ],
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
    );
  }

  questionWidget() {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      child: Text(
        questionList[currentQuestionIndex].questionText,
        style: TextStyle(
          color: Colors.blueGrey,
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  _nextButton() {
    bool isLastQuestion = false;

    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }
    return Container(
      height: 30,
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            if (isLastQuestion) {
              showToast("List Finished");
            } else {
              currentQuestionIndex++;
            }
          });
        },
        style: TextButton.styleFrom(
          fixedSize: Size(180, 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          side: BorderSide(color: Colors.blueGrey, width: 2),
          backgroundColor: Color.fromRGBO(243, 246, 246, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.forward_outlined,
              color: Colors.blueGrey,
              size: 15,
            ),
            Text(
              "Try another one",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }

  showToast(text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
