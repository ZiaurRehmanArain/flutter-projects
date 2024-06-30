import 'package:flutter/material.dart';
import 'package:noteapp/component/note_setting.dart';
import 'package:popover/popover.dart';

class NoteTile extends StatelessWidget {
  final String title;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;

  const NoteTile({super.key, required this.title,required this.onDeletePressed,required this.onEditPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 25, right: 25),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        title: Text(title),
        trailing:Builder(builder: (context) => IconButton(onPressed: ()=>showPopover(
          width: 100,
          height: 100,
          context: context, bodyBuilder: (context) => NoteSetting(onDeleteTap: onDeletePressed,onEditTap: onEditPressed,),), icon:const Icon(Icons.more_vert)),)
      ),
    );
  }
}
