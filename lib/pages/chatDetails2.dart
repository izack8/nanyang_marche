// import 'package:chatview/chatview.dart';
// import 'package:nanyang_marche/models/data.dart';
// import 'package:nanyang_marche/models/theme.dart';
// import 'package:flutter/material.dart';
//
//
// class ChatScreen extends StatefulWidget {
//   const ChatScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   AppTheme theme = LightTheme();
//   bool isDarkTheme = false;
//   final sender = ChatUser(id: '1', name: 'Flutter');
//   final receiver = ChatUser(id: '2', name: 'Simform');
//   final _chatController = ChatController(
//     initialMessageList: Data.messageList,
//     scrollController: ScrollController(),
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ChatView(
//         sender: sender,
//         receiver: receiver,
//         chatController: _chatController,
//         onSendTap: _onSendTap,
//         typeIndicatorConfig: TypeIndicatorConfiguration(
//           flashingCircleBrightColor: theme.flashingCircleBrightColor,
//           flashingCircleDarkColor: theme.flashingCircleDarkColor,
//         ),
//         appBar: ChatViewAppBar(
//           elevation: theme.elevation,
//           backGroundColor: theme.appBarColor,
//           profilePicture: Data.profileImage,
//           backArrowColor: theme.backArrowColor,
//           title: receiver.name,
//           titleTextStyle: TextStyle(
//             color: theme.appBarTitleTextStyle,
//             fontWeight: FontWeight.bold,
//             fontSize: 18,
//             letterSpacing: 0.25,
//           ),
//           userStatus: "online",
//           userStatusTextStyle: const TextStyle(color: Colors.grey),
//           actions: [
//             IconButton(
//               onPressed: _onThemeIconTap,
//               icon: Icon(
//                 isDarkTheme
//                     ? Icons.brightness_4_outlined
//                     : Icons.dark_mode_outlined,
//                 color: theme.themeIconColor,
//               ),
//             ),
//           ],
//         ),
//         chatBackgroundConfig: ChatBackgroundConfiguration(
//           messageTimeIconColor: theme.messageTimeIconColor,
//           messageTimeTextStyle: TextStyle(color: theme.messageTimeTextColor),
//           defaultGroupSeparatorConfig: DefaultGroupSeparatorConfiguration(
//             textStyle: TextStyle(
//               color: theme.chatHeaderColor,
//               fontSize: 17,
//             ),
//           ),
//           backgroundColor: theme.backgroundColor,
//         ),
//         sendMessageConfig: SendMessageConfiguration(
//           replyMessageColor: theme.replyMessageColor,
//           defaultSendButtonColor: theme.sendButtonColor,
//           replyDialogColor: theme.replyDialogColor,
//           replyTitleColor: theme.replyTitleColor,
//           textFieldBackgroundColor: theme.textFieldBackgroundColor,
//           closeIconColor: theme.closeIconColor,
//           textStyle: TextStyle(color: theme.textFieldTextColor),
//         ),
//         chatBubbleConfig: ChatBubbleConfiguration(
//           outgoingChatBubbleConfig: ChatBubble(
//             linkPreviewConfig: LinkPreviewConfiguration(
//               backgroundColor: theme.linkPreviewOutgoingChatColor,
//               bodyStyle: theme.outgoingChatLinkBodyStyle,
//               titleStyle: theme.outgoingChatLinkTitleStyle,
//             ),
//             color: theme.outgoingChatBubbleColor,
//           ),
//           inComingChatBubbleConfig: ChatBubble(
//             linkPreviewConfig: LinkPreviewConfiguration(
//               linkStyle: TextStyle(
//                 color: theme.inComingChatBubbleTextColor,
//                 decoration: TextDecoration.underline,
//               ),
//               backgroundColor: theme.linkPreviewIncomingChatColor,
//               bodyStyle: theme.incomingChatLinkBodyStyle,
//               titleStyle: theme.incomingChatLinkTitleStyle,
//             ),
//             textStyle: TextStyle(color: theme.inComingChatBubbleTextColor),
//             color: theme.inComingChatBubbleColor,
//           ),
//         ),
//         replyPopupConfig: ReplyPopupConfiguration(
//           backgroundColor: theme.replyPopupColor,
//           buttonTextStyle: TextStyle(color: theme.replyPopupButtonColor),
//           topBorderColor: theme.replyPopupTopBorderColor,
//         ),
//         reactionPopupConfig: ReactionPopupConfiguration(
//           shadow: BoxShadow(
//             color: isDarkTheme ? Colors.black54 : Colors.grey.shade400,
//             blurRadius: 20,
//           ),
//           backgroundColor: theme.reactionPopupColor,
//           onEmojiTap: _chatController.setReaction,
//         ),
//         messageConfig: MessageConfiguration(
//           messageReactionConfig: MessageReactionConfiguration(
//             backgroundColor: theme.messageReactionBackGroundColor,
//             borderColor: theme.messageReactionBackGroundColor,
//           ),
//           imageMessageConfig: ImageMessageConfiguration(
//             shareIconConfig: ShareIconConfiguration(
//               defaultIconBackgroundColor: theme.shareIconBackgroundColor,
//               defaultIconColor: theme.shareIconColor,
//             ),
//           ),
//         ),
//         profileCircleConfig:
//         ProfileCircleConfiguration(profileImageUrl: Data.profileImage),
//         repliedMessageConfig: RepliedMessageConfiguration(
//           backgroundColor: theme.repliedMessageColor,
//           verticalBarColor: theme.verticalBarColor,
//           textStyle: const TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 0.25,
//           ),
//           replyTitleTextStyle: TextStyle(color: theme.repliedTitleTextColor),
//         ),
//         swipeToReplyConfig: SwipeToReplyConfiguration(
//           replyIconColor: theme.swipeToReplyIconColor,
//         ),
//       ),
//     );
//   }
//
//   void _onSendTap(String message, ReplyMessage replyMessage) {
//     final id = int.parse(Data.messageList.last.id) + 1;
//     _chatController.addMessage(
//       Message(
//         id: id.toString(),
//         createdAt: DateTime.now(),
//         message: message,
//         sendBy: sender.id,
//         replyMessage: replyMessage,
//       ),
//     );
//   }
//
//   void _onThemeIconTap() {
//     setState(() {
//       if (isDarkTheme) {
//         theme = LightTheme();
//         isDarkTheme = false;
//       } else {
//         theme = DarkTheme();
//         isDarkTheme = true;
//       }
//     });
//   }
// }
