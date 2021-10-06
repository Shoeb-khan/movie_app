import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:untitled3/app/data/utils/styling.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: Get.height
          ),
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(

                  onChanged: (value){
                    controller.searchtext.value = value;
                  },
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  decoration: InputDecoration(
                      fillColor: Appthem.textFieldColor,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.00),
                          borderSide: BorderSide(
                            color: Colors.white,
                          )),
                      prefixIcon: InkWell(
                        onTap: (){
                          controller.apicall();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/frame.svg',
                          ),
                        ),
                      ),
                      suffixIcon: InkWell(
                        onTap: (){
                          controller.searchtext.value = "";
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/group220.svg',
                          ),
                        ),
                      )),
                )
              ),
              Expanded(
                child: Obx(()=> controller.movie.length==0? Center(
                  child: Text("No Movies Are Available with this name",style: TextStyle(color: Colors.white),),
                ): ListView.builder(
                    itemCount: controller.movie.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              height:Get.height*0.25,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image(
                                      width: Get.width,
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          '${controller.movie[index].poster}'),
                                    ),
                                  ),
                                  Positioned(child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.00),
                                        color: Colors.transparent
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text('${controller.movie[index].title}',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                          ),
                          Padding(padding:const EdgeInsets.only(left: 30,top: 15),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/group356.svg',height: 16,),
                              SizedBox(width: 20,),
                              Text('2 hours 1 minute',style: TextStyle(color: Appthem.textColorOrange),)
                            ],
                          ))
                        ],
                      );
                    })),
              ),

              /* ElevatedButton(onPressed: (){
                controller.apicall();
              },
                  child: Text('Call Api'))*/
            ],
          ),
        ),
      ),
    );
  }
}

//

