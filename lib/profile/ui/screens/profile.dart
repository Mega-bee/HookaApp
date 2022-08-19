import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooka/profile/profile_routes.dart';
import 'package:hooka/profile/response/profile_response.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../../utils/style/colors.dart';
import '../../state_manager/profile_state_manager.dart';
@injectable
class Profile extends StatefulWidget {
final GetProfileCubit cubit;

Profile(this.cubit);


  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
   ProfileResponse? profileResponse;
  // Function goEditprof;
  @override
  void initState() {
    super.initState();
    widget.cubit.getProfile(this);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined,color: Primarycolor,size: 35,),
          onPressed: (){Navigator.of(context).pop();},
        ),
        title: Text("My Account",style: TextStyle(color: Primarycolor),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Primarycolor)),
          TextButton(onPressed: (){}, child:TextButton(
              onPressed:(){
                Navigator.pushNamed(context, ProfileRoutes.Edit,arguments: profileResponse);


              },
              child: Text("Edit",style: TextStyle(color: Primarycolor),)),)

        ],
      ),
      body: BlocBuilder<GetProfileCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      )


    );
  }
}
