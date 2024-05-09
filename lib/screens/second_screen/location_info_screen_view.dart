import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:pulse_play/components/app_text_btn.dart';
import 'package:pulse_play/extensions/buildcontext/loc.dart';
import 'package:pulse_play/models/location_info.dart';
import 'package:pulse_play/screens/second_screen/location_info_screen_controller.dart';
import 'package:pulse_play/theme/theme.dart';

class LocationInfoScreen extends StatelessWidget {
  const LocationInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<LocationInfoScreenController>(
          builder: (context, controller, child) {
            return Stack(
              children: [
                if (controller.isLoading) _loadingIndicator(),
                if (!controller.isLoading && controller.locationInfo != null)
                  _buildScreen(controller.locationInfo, context),
                if (!controller.isLoading && controller.error.isNotEmpty)
                  _errorIndicator(controller.error),
              ],
            );
          }
        ),
      )
    );
  }

Widget _buildScreen(LocationInfo? locationInfo, BuildContext context) {
  if (locationInfo != null) {
    return Column(
      children: [
        _buildMap(locationInfo.lat, locationInfo.lon),
        _buidInfo(locationInfo, context),        
      ],
    );
  } else {
    return const Center(
      child: Text("Error with fetching data"),
    );
  }
}


  _buildMap(double lat, double lon) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          height: 200,
          child: FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(lat, lon),
              initialZoom: 10.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buidInfo(LocationInfo locationInfo, BuildContext context){
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          _buildProperty(context.loc.status, locationInfo.status, context),
          _buildProperty(context.loc.continent, locationInfo.continent, context),
          _buildProperty(context.loc.continent_code, locationInfo.continentCode, context),
          _buildProperty(context.loc.country, locationInfo.country, context),
          _buildProperty(context.loc.country_code, locationInfo.countryCode, context),
          _buildProperty(context.loc.region, locationInfo.region, context),
          _buildProperty(context.loc.region_name, locationInfo.regionName, context),
          _buildProperty(context.loc.city, locationInfo.city, context),
          _buildProperty(context.loc.district, locationInfo.district,context),
          _buildProperty(context.loc.zip, locationInfo.zip, context),
          _buildProperty(context.loc.latitude, locationInfo.lat.toString(), context),
          _buildProperty(context.loc.longitude, locationInfo.lon.toString(), context),
          _buildProperty(context.loc.timezone, locationInfo.timezone, context),
          _buildProperty(context.loc.offset, locationInfo.offset.toString(), context),
          _buildProperty(context.loc.currency, locationInfo.currency, context),
          _buildProperty(context.loc.isp, locationInfo.isp, context),
          _buildProperty(context.loc.organization, locationInfo.org, context),
          _buildProperty(context.loc.welcome_as, locationInfo.welcomeAs, context),
          _buildProperty(context.loc.as_name, locationInfo.asname, context),
          _buildProperty(context.loc.reverse, locationInfo.reverse, context),
          _buildProperty(context.loc.mobile, locationInfo.mobile.toString(), context),
          _buildProperty(context.loc.proxy, locationInfo.proxy.toString(), context),
          _buildProperty(context.loc.hosting, locationInfo.hosting.toString(), context),
          _buildProperty(context.loc.query, locationInfo.query, context),
          AppTextBtn(
              label: context.loc.reload,
              onTap: () => context.read<LocationInfoScreenController>().fetchData(),
            ),
          ],
        ),
      )
    );
  }

  _buildProperty(String label, String value, BuildContext context){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: darkGreyClr),
        borderRadius: BorderRadius.circular(15)
      ),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Text('$label: $value', style: const TextStyle(fontSize: 17),),
    );
  }

  _loadingIndicator(){
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _errorIndicator(String error) {
    return Center(
      child: Text(error),
    );
  }
}


