class LocationInfo {
    final String status;
    final String continent;
    final String continentCode;
    final String country;
    final String countryCode;
    final String region;
    final String regionName;
    final String city;
    final String district;
    final String zip;
    final double lat;
    final double lon;
    final String timezone;
    final int offset;
    final String currency;
    final String isp;
    final String org;
    final String welcomeAs;
    final String asname;
    final String reverse;
    final bool mobile;
    final bool proxy;
    final bool hosting;
    final String query;

    LocationInfo({
        required this.status,
        required this.continent,
        required this.continentCode,
        required this.country,
        required this.countryCode,
        required this.region,
        required this.regionName,
        required this.city,
        required this.district,
        required this.zip,
        required this.lat,
        required this.lon,
        required this.timezone,
        required this.offset,
        required this.currency,
        required this.isp,
        required this.org,
        required this.welcomeAs,
        required this.asname,
        required this.reverse,
        required this.mobile,
        required this.proxy,
        required this.hosting,
        required this.query,
    });

    factory LocationInfo.fromJson(Map<String, dynamic> json) => LocationInfo(
        status: json["status"],
        continent: json["continent"],
        continentCode: json["continentCode"],
        country: json["country"],
        countryCode: json["countryCode"],
        region: json["region"],
        regionName: json["regionName"],
        city: json["city"],
        district: json["district"],
        zip: json["zip"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        timezone: json["timezone"],
        offset: json["offset"],
        currency: json["currency"],
        isp: json["isp"],
        org: json["org"],
        welcomeAs: json["as"],
        asname: json["asname"],
        reverse: json["reverse"],
        mobile: json["mobile"],
        proxy: json["proxy"],
        hosting: json["hosting"],
        query: json["query"],
    );
}
