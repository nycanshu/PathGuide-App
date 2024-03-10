import 'package:flutter/material.dart';

import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import 'dart:math' as math;

final String userId = math.Random().nextInt(10000).toString();

class GroupCallScreen extends StatelessWidget {
  GroupCallScreen({super.key});

  final callingId = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Row(
            children: [
              Expanded(
                  child: TextFormField(
                controller: callingId,
                decoration:
                    const InputDecoration(labelText: 'Join group call by id'),
              )),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CallPage(callingId: callingId.text.toString());
                        },
                      ),
                    );
                  },
                  child: const Text('Join'))
            ],
          ),
        ),
      ),
    );
  }
}

class Utils {
  static int appId = 1809101661; // enter your id
  static String appSignin =
      "e04bbe3dbab98376eb62b8dc017946700295ee084eafb41efe207411724a8f80";
}

class CallPage extends StatelessWidget {
  final String callingId;
  const CallPage({super.key, required this.callingId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ZegoUIKitPrebuiltCall(
      appID: Utils.appId,
      appSign: Utils.appSignin,
      userID: userId,
      userName: 'username_$userId',
      callID: callingId,
      config: ZegoUIKitPrebuiltCallConfig.groupVideoCall(),
    ));
  }
}
