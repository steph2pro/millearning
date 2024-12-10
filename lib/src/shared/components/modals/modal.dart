
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';


import './error_toast_widget.dart';


void showErrorModal(String error) async {
  Widget widget = ErrorToasWidget(
    title: error,
    isSuccessCheck: true,
    duration: const Duration(seconds: 10),
  );

  showToastWidget(widget, duration: const Duration(seconds: 10), position: const ToastPosition(align: Alignment.bottomCenter));
}

void showSuccesModal(String text) async {
  Widget widget = ErrorToasWidget(
    title: text,
    isSuccessCheck: false,
    duration: const Duration(seconds: 10),
  );

  showToastWidget(widget, duration: const Duration(seconds: 10), position: const ToastPosition(align: Alignment.bottomCenter));
}

void showWarnningModal(String text) async {
  Widget widget = ClipRRect(
    borderRadius: BorderRadius.circular(110.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(110),
        color: const Color(0xFFF4B740),
      ),
      padding: const EdgeInsets.fromLTRB(10, 110, 10, 110),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
      child: Row(
        children: [
          const Icon(
            Icons.info_outline,
            size: 30.0,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(child: Text(text))
        ],
      ),
    ),
  );

  showToastWidget(widget, duration: const Duration(seconds: 2), position: const ToastPosition(align: Alignment.bottomCenter));
}

void showCancelledModal(String text) async {
  Widget widget = ErrorToasWidget(
    title: text,
    duration: const Duration(seconds: 10),
  );

  showToastWidget(widget, duration: const Duration(seconds: 10), position: const ToastPosition(align: Alignment.bottomCenter));
}

void showModal(String text, [bool isSuccessCheck = false]) async {
  Widget widget = ErrorToasWidget(
    title: text,
    isSuccessCheck: isSuccessCheck,
    duration: const Duration(seconds: 10),
  );

  showToastWidget(widget, duration: const Duration(seconds: 10), position: const ToastPosition(align: Alignment.bottomCenter));
}