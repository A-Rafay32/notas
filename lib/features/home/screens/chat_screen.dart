// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:grouped_list/grouped_list.dart';
// import 'package:notas/app/themes/app_colors.dart';
// import 'package:notas/core/extensions/routes_extenstion.dart';
// import 'package:notas/features/auth/providers/auth_providers.dart';
// import 'package:notas/features/auth/screens/widgets/app_bar_white.dart';
// import 'package:notas/features/home/models/message.dart';
// import 'package:notas/features/home/screens/widgets/chat_text_field.dart';
// import 'package:notas/features/home/screens/widgets/custom_pop_menu_button.dart';
// // import 'package:notas/features/seller/provider/seller_provider.dart';

// class ChatScreen extends ConsumerStatefulWidget {
//   const ChatScreen({super.key, required this.sentTo});

//   final String sentTo;

//   @override
//   ConsumerState<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends ConsumerState<ChatScreen> {
//   ScrollController scrollController = ScrollController();

//   void scrollDown() {
//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       scrollController.animateTo(scrollController.position.maxScrollExtent,
//           duration: const Duration(milliseconds: 400), curve: Curves.ease);
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   FocusNode chatFocus = FocusNode();
//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.sizeOf(context).height;
//     double w = MediaQuery.sizeOf(context).width;

//     // final sellerValue = ref.watch(getSellerProvider(widget.sentTo));
//     // final userValue =
//     //     ref.watch(getUserProvider(sellerValue.value?.userId ?? ""));

//     return Scaffold(
//       appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(54),
//           child: CustomAppBar(
//             text: "userValue.value?.userDetails.name" ?? "",
//             onPressed: () {
//               context.pop();
//             },
//           )),
//       resizeToAvoidBottomInset: false,
//       body: Column(
//         children: [
//           Expanded(
//             child: GroupedListView<Message, DateTime>(
//                 controller: scrollController,
//                 padding: const EdgeInsets.all(8),
//                 elements: messageList,
//                 groupBy: (element) => DateTime(2023),
//                 order: GroupedListOrder.ASC,
//                 groupSeparatorBuilder: (value) => const Divider(),
//                 itemBuilder: (context, Message messages) {
//                   // scrolling
//                   return Align(
//                       alignment: messages.isSentByMe
//                           ? Alignment.centerRight
//                           : Alignment.centerLeft,
//                       child: Container(
//                         constraints: BoxConstraints(maxWidth: 230.w),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               bottomLeft: const Radius.circular(10),
//                               bottomRight: const Radius.circular(10),
//                               topRight: messages.isSentByMe
//                                   ? const Radius.circular(0)
//                                   : const Radius.circular(10),
//                               topLeft: messages.isSentByMe
//                                   ? const Radius.circular(10)
//                                   : const Radius.circular(0)),
//                           color: messages.isSentByMe
//                               ? AppColors.primaryColor
//                               : AppColors.primaryColor.withOpacity(0.1),
//                         ),
//                         margin:
//                             EdgeInsets.symmetric(horizontal: 8, vertical: 20.h),
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 8, vertical: 10),
//                         child: Text(
//                           messages.message,
//                           style: Theme.of(context)
//                               .textTheme
//                               .labelMedium
//                               ?.copyWith(
//                                   color: messages.isSentByMe
//                                       ? Colors.white
//                                       : Colors.black,
//                                   fontWeight: FontWeight.w500),
//                         ),
//                       ));
//                 }),
//           ),
//           AnimatedPositioned(
//               duration: const Duration(milliseconds: 70),
//               curve: Curves.ease,
//               bottom: MediaQuery.of(context).viewInsets.bottom,
//               left: 0,
//               right: 0,
//               child: ChatTextField(
//                 focus: chatFocus,
//                 h: h,
//                 w: w,
//               ))
//         ],
//       ),
//     );
//   }
// }

// class ChatPopupMenuButton extends StatelessWidget {
//   const ChatPopupMenuButton({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton(
//         constraints: const BoxConstraints(maxWidth: 130),
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(30))),
//         icon: Icon(Icons.more_vert_rounded, size: 30.h, color: Colors.black),
//         color: Colors.white,
//         itemBuilder: (context) => <PopupMenuEntry>[
//               PopupMenuItem(
//                 child: PopUpButton(press: () {}, title: "Seller Profile"),
//               ),
//               PopupMenuItem(
//                   child: PopUpButton(
//                 press: () {},
//                 title: "Clear Chat",
//               )),
//               PopupMenuItem(child: PopUpButton(press: () {}, title: "Report")),
//             ]);
//   }
// }
