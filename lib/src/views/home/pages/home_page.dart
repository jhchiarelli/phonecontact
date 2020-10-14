import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phonecontact/src/views/home/controller/home_controller.dart';
import 'package:phonecontact/src/views/home/widgets/contact_tile.dart';
import 'package:phonecontact/src/views/home/widgets/notification_tile.dart';

class HomePage extends StatelessWidget {
// class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _builBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
        automaticallyImplyLeading: false,
        // backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text('${HomeController.to.appName}'));
  }

  Widget _builBody() {
    return RefreshIndicator(
      onRefresh: HomeController.to.onHomeRefresh,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: GetX<HomeController>(
          builder: (_controller) => !_controller.getLoading
              ? Container(
                height: 300,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _controller.listAbout.length,
                          itemBuilder: (_context, index) {
                            return NotificationTile(_controller.listAbout[index]);
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _controller.listContact.length,
                          itemBuilder: (_context, index) {
                            return ContactTile(_controller.listContact[index]);
                          },
                        ),
                      ),
                    ],
                  ),
              )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
