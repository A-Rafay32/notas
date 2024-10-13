import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notas/app/themes/app_colors.dart';
// import 'package:notas/features/offer/model/offer.dart';

enum InboxType { read, Unread }

class InboxCard extends StatelessWidget {
  const InboxCard(
      {super.key,
      required this.onTap,
      required this.from,
      required this.date,
      required this.inboxType,
      // required this.offerStatus,
      required this.message});

  final String from;
  final String date;
  // final OfferStatus offerStatus;
  final String message;
  final InboxType inboxType;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
          width: double.infinity,
          child: Card(
              color: Colors.orange.shade100,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text(from,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  color: Colors.black,
                                  fontSize: 19.sp,
                                  fontWeight: FontWeight.w600,
                                )),
                        const Spacer(),
                        // AcceptivityBadge(offerStatus: offerStatus)
                      ]),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: date,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  color: Colors.grey.shade600,
                                  fontSize: 17.sp,
                                )),
                        const WidgetSpan(child: SizedBox(width: 5)),
                        if (inboxType == InboxType.Unread)
                          TextSpan(
                            text: inboxType.name,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  color: AppColors.primaryColor,
                                  fontSize: 17.sp,
                                ),
                          )
                      ])),
                      SizedBox(height: 8.h),
                      Container(
                          width: 300.w,
                          padding: const EdgeInsets.all(4),
                          child: Text(message,
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    color: inboxType == InboxType.Unread
                                        ? AppColors.primaryColor
                                        : Colors.grey.shade600,
                                    fontSize: 17.sp,
                                  ))),
                    ]),
              ))),
    );
  }
}

// class AcceptivityBadge extends StatelessWidget {
//   const AcceptivityBadge({super.key, required this.offerStatus});

//   final OfferStatus offerStatus;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         color: offerStatus == OfferStatus.accepted
//             ? Colors.green.shade600.withOpacity(0.3)
//             : offerStatus == OfferStatus.pending
//                 ? Colors.blue.shade600.withOpacity(0.3)
//                 : Colors.red.shade600.withOpacity(0.3),
//       ),
//       child: Icon(
//         offerStatus == OfferStatus.accepted
//             ? Icons.check
//             : offerStatus == OfferStatus.pending
//                 ? Icons.pending
//                 : Icons.cancel,
//         color: offerStatus == OfferStatus.accepted
//             ? Colors.green.shade900
//             : offerStatus == OfferStatus.pending
//                 ? Colors.blue.shade600
//                 : Colors.red.shade900,
//       ),
//     );
//   }
// }
