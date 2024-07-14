import 'package:bolg/platformChannel/method_channel_util.dart';
import 'package:flutter/material.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('기능예시 리스트'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                MethodChannelUtil.getPlatformVersion();
              },
              child: const Text('1.안드로이드 버전 가져오기'),
            ),
            ElevatedButton(
              onPressed: () {
                MethodChannelUtil.showMyToast(msg : '안녕하세요!');
              },
              child: const Text('2.토스트메세지기능'),
            ),
            ElevatedButton(
              onPressed: () {
                MethodChannelUtil.wrongMethod();
              },
              child: const Text('3.잘못된메소드명호출하기'),
            )
          ],
        ),
      ),
    );
  }
}
