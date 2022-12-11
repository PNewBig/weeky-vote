import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:weeky_vote/Controller/TeamRoomController.dart';

import '../Widget/BuildUserBox.dart';

class HomePage extends StatefulWidget {
  String teamId;
  HomePage({required this.teamId,super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _roomId = "";

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _roomId = ModalRoute.of(context)!.settings.arguments as String;
    Provider.of<TeamRoomController>(context, listen: false)
        .fetchRoomData(_roomId);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TeamRoomController>(builder: (context, teamData, child) {
      if (teamData.toString().isEmpty) {
        return Center(child: CircularProgressIndicator());
      } else if (teamData.getTeamData.list != null) {
        return Container(
            child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: teamData.getTeamData.list!.length,
          itemBuilder: ((context, index) {
            return BuildUserBox(
              fname: teamData.getTeamData.list![index].fname.toString(),
              lname: teamData.getTeamData.list![index].lname.toString(),
              userId: teamData.getTeamData.list![index].userId.toString(),
              teamId: widget.teamId
              
            );
          }),
        ));
      }else{
        return Center(child:CircularProgressIndicator());
      }
    });
  }
}
