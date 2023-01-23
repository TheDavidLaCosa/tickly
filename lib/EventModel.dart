// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'dart:convert';

EventModel eventModelFromJson(String str) => EventModel.fromJson(json.decode(str));

String eventModelToJson(EventModel data) => json.encode(data.toJson());

class EventModel {
  EventModel({
    required this.embedded,
    required this.links,
    required this.page,
  });

  EventModelEmbedded embedded;
  EventModelLinks links;
  Page page;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
    embedded: EventModelEmbedded.fromJson(json["_embedded"]),
    links: EventModelLinks.fromJson(json["_links"]),
    page: Page.fromJson(json["page"]),
  );

  Map<String, dynamic> toJson() => {
    "_embedded": embedded.toJson(),
    "_links": links.toJson(),
    "page": page.toJson(),
  };
}

class EventModelEmbedded {
  EventModelEmbedded({
    required this.events,
  });

  List<Event> events;

  factory EventModelEmbedded.fromJson(Map<String, dynamic> json) => EventModelEmbedded(
    events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "events": List<dynamic>.from(events.map((x) => x.toJson())),
  };
}

class Event {
  Event({
    required this.name,
    required this.type,
    required this.id,
    required this.test,
    required this.url,
    required this.locale,
    required this.images,
    required this.sales,
    required this.dates,
    required this.classifications,
    this.promoter,
    this.promoters,
    this.pleaseNote,
    this.priceRanges,
    this.products,
    required this.seatmap,
    this.accessibility,
    this.ticketLimit,
    this.ageRestrictions,
    this.ticketing,
    required this.links,
    required this.embedded,
    this.info,
    this.outlets,
  });

  String name;
  EventType type;
  String id;
  bool test;
  String url;
  Locale locale;
  List<Image> images;
  Sales sales;
  Dates dates;
  List<Classification> classifications;
  Promoter? promoter;
  List<Promoter>? promoters;
  String? pleaseNote;
  List<PriceRange>? priceRanges;
  List<Product>? products;
  Seatmap seatmap;
  Accessibility? accessibility;
  TicketLimit? ticketLimit;
  AgeRestrictions? ageRestrictions;
  Ticketing? ticketing;
  EventLinks links;
  EventEmbedded embedded;
  String? info;
  List<Outlet>? outlets;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    name: json["name"],
    type: eventTypeValues.map[json["type"]]!,
    id: json["id"],
    test: json["test"],
    url: json["url"],
    locale: localeValues.map[json["locale"]]!,
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    sales: Sales.fromJson(json["sales"]),
    dates: Dates.fromJson(json["dates"]),
    classifications: List<Classification>.from(json["classifications"].map((x) => Classification.fromJson(x))),
    promoter: json["promoter"] == null ? null : Promoter.fromJson(json["promoter"]),
    promoters: json["promoters"] == null ? [] : List<Promoter>.from(json["promoters"]!.map((x) => Promoter.fromJson(x))),
    pleaseNote: json["pleaseNote"],
    priceRanges: json["priceRanges"] == null ? [] : List<PriceRange>.from(json["priceRanges"]!.map((x) => PriceRange.fromJson(x))),
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    seatmap: Seatmap.fromJson(json["seatmap"]),
    accessibility: json["accessibility"] == null ? null : Accessibility.fromJson(json["accessibility"]),
    ticketLimit: json["ticketLimit"] == null ? null : TicketLimit.fromJson(json["ticketLimit"]),
    ageRestrictions: json["ageRestrictions"] == null ? null : AgeRestrictions.fromJson(json["ageRestrictions"]),
    ticketing: json["ticketing"] == null ? null : Ticketing.fromJson(json["ticketing"]),
    links: EventLinks.fromJson(json["_links"]),
    embedded: EventEmbedded.fromJson(json["_embedded"]),
    info: json["info"],
    outlets: json["outlets"] == null ? [] : List<Outlet>.from(json["outlets"]!.map((x) => Outlet.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": eventTypeValues.reverse[type],
    "id": id,
    "test": test,
    "url": url,
    "locale": localeValues.reverse[locale],
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "sales": sales.toJson(),
    "dates": dates.toJson(),
    "classifications": List<dynamic>.from(classifications.map((x) => x.toJson())),
    "promoter": promoter?.toJson(),
    "promoters": promoters == null ? [] : List<dynamic>.from(promoters!.map((x) => x.toJson())),
    "pleaseNote": pleaseNote,
    "priceRanges": priceRanges == null ? [] : List<dynamic>.from(priceRanges!.map((x) => x.toJson())),
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    "seatmap": seatmap.toJson(),
    "accessibility": accessibility?.toJson(),
    "ticketLimit": ticketLimit?.toJson(),
    "ageRestrictions": ageRestrictions?.toJson(),
    "ticketing": ticketing?.toJson(),
    "_links": links.toJson(),
    "_embedded": embedded.toJson(),
    "info": info,
    "outlets": outlets == null ? [] : List<dynamic>.from(outlets!.map((x) => x.toJson())),
  };
}

class Accessibility {
  Accessibility({
    this.info,
    required this.ticketLimit,
  });

  String? info;
  int ticketLimit;

  factory Accessibility.fromJson(Map<String, dynamic> json) => Accessibility(
    info: json["info"],
    ticketLimit: json["ticketLimit"],
  );

  Map<String, dynamic> toJson() => {
    "info": info,
    "ticketLimit": ticketLimit,
  };
}

class AgeRestrictions {
  AgeRestrictions({
    required this.legalAgeEnforced,
  });

  bool legalAgeEnforced;

  factory AgeRestrictions.fromJson(Map<String, dynamic> json) => AgeRestrictions(
    legalAgeEnforced: json["legalAgeEnforced"],
  );

  Map<String, dynamic> toJson() => {
    "legalAgeEnforced": legalAgeEnforced,
  };
}

class Classification {
  Classification({
    required this.primary,
    required this.segment,
    required this.genre,
    required this.subGenre,
    this.type,
    this.subType,
    required this.family,
  });

  bool primary;
  Genre segment;
  Genre genre;
  Genre subGenre;
  Genre? type;
  Genre? subType;
  bool family;

  factory Classification.fromJson(Map<String, dynamic> json) => Classification(
    primary: json["primary"],
    segment: Genre.fromJson(json["segment"]),
    genre: Genre.fromJson(json["genre"]),
    subGenre: Genre.fromJson(json["subGenre"]),
    type: json["type"] == null ? null : Genre.fromJson(json["type"]),
    subType: json["subType"] == null ? null : Genre.fromJson(json["subType"]),
    family: json["family"],
  );

  Map<String, dynamic> toJson() => {
    "primary": primary,
    "segment": segment.toJson(),
    "genre": genre.toJson(),
    "subGenre": subGenre.toJson(),
    "type": type?.toJson(),
    "subType": subType?.toJson(),
    "family": family,
  };
}

class Genre {
  Genre({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Dates {
  Dates({
    required this.start,
    this.timezone,
    required this.status,
    required this.spanMultipleDays,
  });

  Start start;
  String? timezone;
  Status status;
  bool spanMultipleDays;

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
    start: Start.fromJson(json["start"]),
    timezone: json["timezone"],
    status: Status.fromJson(json["status"]),
    spanMultipleDays: json["spanMultipleDays"],
  );

  Map<String, dynamic> toJson() => {
    "start": start.toJson(),
    "timezone": timezone,
    "status": status.toJson(),
    "spanMultipleDays": spanMultipleDays,
  };
}

class Start {
  Start({
    required this.localDate,
    required this.localTime,
    required this.dateTime,
    required this.dateTbd,
    required this.dateTba,
    required this.timeTba,
    required this.noSpecificTime,
  });

  DateTime localDate;
  String localTime;
  DateTime dateTime;
  bool dateTbd;
  bool dateTba;
  bool timeTba;
  bool noSpecificTime;

  factory Start.fromJson(Map<String, dynamic> json) => Start(
    localDate: DateTime.parse(json["localDate"]),
    localTime: json["localTime"],
    dateTime: DateTime.parse(json["dateTime"]),
    dateTbd: json["dateTBD"],
    dateTba: json["dateTBA"],
    timeTba: json["timeTBA"],
    noSpecificTime: json["noSpecificTime"],
  );

  Map<String, dynamic> toJson() => {
    "localDate": "${localDate.year.toString().padLeft(4, '0')}-${localDate.month.toString().padLeft(2, '0')}-${localDate.day.toString().padLeft(2, '0')}",
    "localTime": localTime,
    "dateTime": dateTime.toIso8601String(),
    "dateTBD": dateTbd,
    "dateTBA": dateTba,
    "timeTBA": timeTba,
    "noSpecificTime": noSpecificTime,
  };
}

class Status {
  Status({
    required this.code,
  });

  Code code;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    code: codeValues.map[json["code"]]!,
  );

  Map<String, dynamic> toJson() => {
    "code": codeValues.reverse[code],
  };
}

enum Code { ONSALE }

final codeValues = EnumValues({
  "onsale": Code.ONSALE
});

class EventEmbedded {
  EventEmbedded({
    required this.venues,
    required this.attractions,
  });

  List<Venue> venues;
  List<Attraction> attractions;

  factory EventEmbedded.fromJson(Map<String, dynamic> json) => EventEmbedded(
    venues: List<Venue>.from(json["venues"].map((x) => Venue.fromJson(x))),
    attractions: List<Attraction>.from(json["attractions"].map((x) => Attraction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "venues": List<dynamic>.from(venues.map((x) => x.toJson())),
    "attractions": List<dynamic>.from(attractions.map((x) => x.toJson())),
  };
}

class Attraction {
  Attraction({
    required this.name,
    required this.type,
    required this.id,
    required this.test,
    required this.url,
    required this.locale,
    required this.externalLinks,
    required this.images,
    required this.classifications,
    required this.upcomingEvents,
    required this.links,
    this.aliases,
  });

  String name;
  AttractionType type;
  String id;
  bool test;
  String url;
  Locale locale;
  ExternalLinks externalLinks;
  List<Image> images;
  List<Classification> classifications;
  UpcomingEvents upcomingEvents;
  AttractionLinks links;
  List<String>? aliases;

  factory Attraction.fromJson(Map<String, dynamic> json) => Attraction(
    name: json["name"],
    type: attractionTypeValues.map[json["type"]]!,
    id: json["id"],
    test: json["test"],
    url: json["url"],
    locale: localeValues.map[json["locale"]]!,
    externalLinks: ExternalLinks.fromJson(json["externalLinks"]),
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    classifications: List<Classification>.from(json["classifications"].map((x) => Classification.fromJson(x))),
    upcomingEvents: UpcomingEvents.fromJson(json["upcomingEvents"]),
    links: AttractionLinks.fromJson(json["_links"]),
    aliases: json["aliases"] == null ? [] : List<String>.from(json["aliases"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": attractionTypeValues.reverse[type],
    "id": id,
    "test": test,
    "url": url,
    "locale": localeValues.reverse[locale],
    "externalLinks": externalLinks.toJson(),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "classifications": List<dynamic>.from(classifications.map((x) => x.toJson())),
    "upcomingEvents": upcomingEvents.toJson(),
    "_links": links.toJson(),
    "aliases": aliases == null ? [] : List<dynamic>.from(aliases!.map((x) => x)),
  };
}

class ExternalLinks {
  ExternalLinks({
    required this.twitter,
    required this.wiki,
    required this.facebook,
    required this.instagram,
    required this.homepage,
  });

  List<Facebook> twitter;
  List<Facebook> wiki;
  List<Facebook> facebook;
  List<Facebook> instagram;
  List<Facebook> homepage;

  factory ExternalLinks.fromJson(Map<String, dynamic> json) => ExternalLinks(
    twitter: List<Facebook>.from(json["twitter"].map((x) => Facebook.fromJson(x))),
    wiki: List<Facebook>.from(json["wiki"].map((x) => Facebook.fromJson(x))),
    facebook: List<Facebook>.from(json["facebook"].map((x) => Facebook.fromJson(x))),
    instagram: List<Facebook>.from(json["instagram"].map((x) => Facebook.fromJson(x))),
    homepage: List<Facebook>.from(json["homepage"].map((x) => Facebook.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "twitter": List<dynamic>.from(twitter.map((x) => x.toJson())),
    "wiki": List<dynamic>.from(wiki.map((x) => x.toJson())),
    "facebook": List<dynamic>.from(facebook.map((x) => x.toJson())),
    "instagram": List<dynamic>.from(instagram.map((x) => x.toJson())),
    "homepage": List<dynamic>.from(homepage.map((x) => x.toJson())),
  };
}

class Facebook {
  Facebook({
    required this.url,
  });

  String url;

  factory Facebook.fromJson(Map<String, dynamic> json) => Facebook(
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
  };
}

class Image {
  Image({
    required this.ratio,
    required this.url,
    required this.width,
    required this.height,
    required this.fallback,
    this.attribution,
  });

  Ratio ratio;
  String url;
  int width;
  int height;
  bool fallback;
  String? attribution;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    ratio: ratioValues.map[json["ratio"]]!,
    url: json["url"],
    width: json["width"],
    height: json["height"],
    fallback: json["fallback"],
    attribution: json["attribution"],
  );

  Map<String, dynamic> toJson() => {
    "ratio": ratioValues.reverse[ratio],
    "url": url,
    "width": width,
    "height": height,
    "fallback": fallback,
    "attribution": attribution,
  };
}

enum Ratio { THE_169, THE_32, THE_43 }

final ratioValues = EnumValues({
  "16_9": Ratio.THE_169,
  "3_2": Ratio.THE_32,
  "4_3": Ratio.THE_43
});

class AttractionLinks {
  AttractionLinks({
    required this.self,
  });

  First self;

  factory AttractionLinks.fromJson(Map<String, dynamic> json) => AttractionLinks(
    self: First.fromJson(json["self"]),
  );

  Map<String, dynamic> toJson() => {
    "self": self.toJson(),
  };
}

class First {
  First({
    required this.href,
  });

  String href;

  factory First.fromJson(Map<String, dynamic> json) => First(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}

enum Locale { EN_US }

final localeValues = EnumValues({
  "en-us": Locale.EN_US
});

enum AttractionType { ATTRACTION }

final attractionTypeValues = EnumValues({
  "attraction": AttractionType.ATTRACTION
});

class UpcomingEvents {
  UpcomingEvents({
    required this.total,
    this.tmr,
    required this.ticketmaster,
    required this.filtered,
  });

  int total;
  int? tmr;
  int ticketmaster;
  int filtered;

  factory UpcomingEvents.fromJson(Map<String, dynamic> json) => UpcomingEvents(
    total: json["_total"],
    tmr: json["tmr"],
    ticketmaster: json["ticketmaster"],
    filtered: json["_filtered"],
  );

  Map<String, dynamic> toJson() => {
    "_total": total,
    "tmr": tmr,
    "ticketmaster": ticketmaster,
    "_filtered": filtered,
  };
}

class Venue {
  Venue({
    required this.name,
    required this.type,
    required this.id,
    required this.test,
    this.url,
    required this.locale,
    required this.postalCode,
    required this.timezone,
    required this.city,
    required this.state,
    required this.country,
    required this.address,
    required this.location,
    this.markets,
    required this.dmas,
    this.boxOfficeInfo,
    this.parkingDetail,
    this.accessibleSeatingDetail,
    this.generalInfo,
    required this.upcomingEvents,
    required this.links,
    this.images,
    this.aliases,
    this.social,
  });

  String name;
  VenueType type;
  String id;
  bool test;
  String? url;
  Locale locale;
  String postalCode;
  String timezone;
  City city;
  State state;
  Country country;
  Address address;
  Location location;
  List<Genre>? markets;
  List<Dma> dmas;
  BoxOfficeInfo? boxOfficeInfo;
  String? parkingDetail;
  String? accessibleSeatingDetail;
  GeneralInfo? generalInfo;
  UpcomingEvents upcomingEvents;
  AttractionLinks links;
  List<Image>? images;
  List<String>? aliases;
  Social? social;

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
    name: json["name"],
    type: venueTypeValues.map[json["type"]]!,
    id: json["id"],
    test: json["test"],
    url: json["url"],
    locale: localeValues.map[json["locale"]]!,
    postalCode: json["postalCode"],
    timezone: json["timezone"],
    city: City.fromJson(json["city"]),
    state: State.fromJson(json["state"]),
    country: Country.fromJson(json["country"]),
    address: Address.fromJson(json["address"]),
    location: Location.fromJson(json["location"]),
    markets: json["markets"] == null ? [] : List<Genre>.from(json["markets"]!.map((x) => Genre.fromJson(x))),
    dmas: List<Dma>.from(json["dmas"].map((x) => Dma.fromJson(x))),
    boxOfficeInfo: json["boxOfficeInfo"] == null ? null : BoxOfficeInfo.fromJson(json["boxOfficeInfo"]),
    parkingDetail: json["parkingDetail"],
    accessibleSeatingDetail: json["accessibleSeatingDetail"],
    generalInfo: json["generalInfo"] == null ? null : GeneralInfo.fromJson(json["generalInfo"]),
    upcomingEvents: UpcomingEvents.fromJson(json["upcomingEvents"]),
    links: AttractionLinks.fromJson(json["_links"]),
    images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
    aliases: json["aliases"] == null ? [] : List<String>.from(json["aliases"]!.map((x) => x)),
    social: json["social"] == null ? null : Social.fromJson(json["social"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": venueTypeValues.reverse[type],
    "id": id,
    "test": test,
    "url": url,
    "locale": localeValues.reverse[locale],
    "postalCode": postalCode,
    "timezone": timezone,
    "city": city.toJson(),
    "state": state.toJson(),
    "country": country.toJson(),
    "address": address.toJson(),
    "location": location.toJson(),
    "markets": markets == null ? [] : List<dynamic>.from(markets!.map((x) => x.toJson())),
    "dmas": List<dynamic>.from(dmas.map((x) => x.toJson())),
    "boxOfficeInfo": boxOfficeInfo?.toJson(),
    "parkingDetail": parkingDetail,
    "accessibleSeatingDetail": accessibleSeatingDetail,
    "generalInfo": generalInfo?.toJson(),
    "upcomingEvents": upcomingEvents.toJson(),
    "_links": links.toJson(),
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
    "aliases": aliases == null ? [] : List<dynamic>.from(aliases!.map((x) => x)),
    "social": social?.toJson(),
  };
}

class Address {
  Address({
    required this.line1,
  });

  String line1;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    line1: json["line1"],
  );

  Map<String, dynamic> toJson() => {
    "line1": line1,
  };
}

class BoxOfficeInfo {
  BoxOfficeInfo({
    required this.phoneNumberDetail,
    required this.openHoursDetail,
    this.willCallDetail,
    this.acceptedPaymentDetail,
  });

  String phoneNumberDetail;
  String openHoursDetail;
  String? willCallDetail;
  String? acceptedPaymentDetail;

  factory BoxOfficeInfo.fromJson(Map<String, dynamic> json) => BoxOfficeInfo(
    phoneNumberDetail: json["phoneNumberDetail"],
    openHoursDetail: json["openHoursDetail"],
    willCallDetail: json["willCallDetail"],
    acceptedPaymentDetail: json["acceptedPaymentDetail"],
  );

  Map<String, dynamic> toJson() => {
    "phoneNumberDetail": phoneNumberDetail,
    "openHoursDetail": openHoursDetail,
    "willCallDetail": willCallDetail,
    "acceptedPaymentDetail": acceptedPaymentDetail,
  };
}

class City {
  City({
    required this.name,
  });

  String name;

  factory City.fromJson(Map<String, dynamic> json) => City(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class Country {
  Country({
    required this.name,
    required this.countryCode,
  });

  CountryName name;
  CountryCode countryCode;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    name: countryNameValues.map[json["name"]]!,
    countryCode: countryCodeValues.map[json["countryCode"]]!,
  );

  Map<String, dynamic> toJson() => {
    "name": countryNameValues.reverse[name],
    "countryCode": countryCodeValues.reverse[countryCode],
  };
}

enum CountryCode { US }

final countryCodeValues = EnumValues({
  "US": CountryCode.US
});

enum CountryName { UNITED_STATES_OF_AMERICA }

final countryNameValues = EnumValues({
  "United States Of America": CountryName.UNITED_STATES_OF_AMERICA
});

class Dma {
  Dma({
    required this.id,
  });

  int id;

  factory Dma.fromJson(Map<String, dynamic> json) => Dma(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}

class GeneralInfo {
  GeneralInfo({
    required this.childRule,
    this.generalRule,
  });

  String childRule;
  String? generalRule;

  factory GeneralInfo.fromJson(Map<String, dynamic> json) => GeneralInfo(
    childRule: json["childRule"],
    generalRule: json["generalRule"],
  );

  Map<String, dynamic> toJson() => {
    "childRule": childRule,
    "generalRule": generalRule,
  };
}

class Location {
  Location({
    required this.longitude,
    required this.latitude,
  });

  String longitude;
  String latitude;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    longitude: json["longitude"],
    latitude: json["latitude"],
  );

  Map<String, dynamic> toJson() => {
    "longitude": longitude,
    "latitude": latitude,
  };
}

class Social {
  Social({
    required this.twitter,
  });

  Twitter twitter;

  factory Social.fromJson(Map<String, dynamic> json) => Social(
    twitter: Twitter.fromJson(json["twitter"]),
  );

  Map<String, dynamic> toJson() => {
    "twitter": twitter.toJson(),
  };
}

class Twitter {
  Twitter({
    required this.handle,
  });

  String handle;

  factory Twitter.fromJson(Map<String, dynamic> json) => Twitter(
    handle: json["handle"],
  );

  Map<String, dynamic> toJson() => {
    "handle": handle,
  };
}

class State {
  State({
    required this.name,
    required this.stateCode,
  });

  String name;
  String stateCode;

  factory State.fromJson(Map<String, dynamic> json) => State(
    name: json["name"],
    stateCode: json["stateCode"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "stateCode": stateCode,
  };
}

enum VenueType { VENUE }

final venueTypeValues = EnumValues({
  "venue": VenueType.VENUE
});

class EventLinks {
  EventLinks({
    required this.self,
    required this.attractions,
    required this.venues,
  });

  First self;
  List<First> attractions;
  List<First> venues;

  factory EventLinks.fromJson(Map<String, dynamic> json) => EventLinks(
    self: First.fromJson(json["self"]),
    attractions: List<First>.from(json["attractions"].map((x) => First.fromJson(x))),
    venues: List<First>.from(json["venues"].map((x) => First.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": self.toJson(),
    "attractions": List<dynamic>.from(attractions.map((x) => x.toJson())),
    "venues": List<dynamic>.from(venues.map((x) => x.toJson())),
  };
}

class Outlet {
  Outlet({
    required this.url,
    required this.type,
  });

  String url;
  String type;

  factory Outlet.fromJson(Map<String, dynamic> json) => Outlet(
    url: json["url"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "type": type,
  };
}

class PriceRange {
  PriceRange({
    required this.type,
    required this.currency,
    required this.min,
    required this.max,
  });

  PriceRangeType type;
  Currency currency;
  double min;
  int max;

  factory PriceRange.fromJson(Map<String, dynamic> json) => PriceRange(
    type: priceRangeTypeValues.map[json["type"]]!,
    currency: currencyValues.map[json["currency"]]!,
    min: json["min"]?.toDouble(),
    max: json["max"],
  );

  Map<String, dynamic> toJson() => {
    "type": priceRangeTypeValues.reverse[type],
    "currency": currencyValues.reverse[currency],
    "min": min,
    "max": max,
  };
}

enum Currency { USD }

final currencyValues = EnumValues({
  "USD": Currency.USD
});

enum PriceRangeType { STANDARD }

final priceRangeTypeValues = EnumValues({
  "standard": PriceRangeType.STANDARD
});

class Product {
  Product({
    required this.name,
    required this.id,
    required this.url,
    required this.type,
    required this.classifications,
  });

  String name;
  String id;
  String url;
  ProductType type;
  List<Classification> classifications;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    name: json["name"],
    id: json["id"],
    url: json["url"],
    type: productTypeValues.map[json["type"]]!,
    classifications: List<Classification>.from(json["classifications"].map((x) => Classification.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "url": url,
    "type": productTypeValues.reverse[type],
    "classifications": List<dynamic>.from(classifications.map((x) => x.toJson())),
  };
}

enum ProductType { PARKING, SPECIAL_ENTRY, UPSELL }

final productTypeValues = EnumValues({
  "Parking": ProductType.PARKING,
  "Special Entry": ProductType.SPECIAL_ENTRY,
  "Upsell": ProductType.UPSELL
});

class Promoter {
  Promoter({
    required this.id,
    required this.name,
    required this.description,
  });

  String id;
  PromoterName name;
  Description description;

  factory Promoter.fromJson(Map<String, dynamic> json) => Promoter(
    id: json["id"],
    name: promoterNameValues.map[json["name"]]!,
    description: descriptionValues.map[json["description"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": promoterNameValues.reverse[name],
    "description": descriptionValues.reverse[description],
  };
}

enum Description { NBA_REGULAR_SEASON_NTL_USA }

final descriptionValues = EnumValues({
  "NBA REGULAR SEASON / NTL / USA": Description.NBA_REGULAR_SEASON_NTL_USA
});

enum PromoterName { NBA_REGULAR_SEASON }

final promoterNameValues = EnumValues({
  "NBA REGULAR SEASON": PromoterName.NBA_REGULAR_SEASON
});

class Sales {
  Sales({
    required this.public,
    this.presales,
  });

  Public public;
  List<Presale>? presales;

  factory Sales.fromJson(Map<String, dynamic> json) => Sales(
    public: Public.fromJson(json["public"]),
    presales: json["presales"] == null ? [] : List<Presale>.from(json["presales"]!.map((x) => Presale.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "public": public.toJson(),
    "presales": presales == null ? [] : List<dynamic>.from(presales!.map((x) => x.toJson())),
  };
}

class Presale {
  Presale({
    required this.startDateTime,
    required this.endDateTime,
    required this.name,
    this.description,
  });

  DateTime startDateTime;
  DateTime endDateTime;
  String name;
  String? description;

  factory Presale.fromJson(Map<String, dynamic> json) => Presale(
    startDateTime: DateTime.parse(json["startDateTime"]),
    endDateTime: DateTime.parse(json["endDateTime"]),
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "startDateTime": startDateTime.toIso8601String(),
    "endDateTime": endDateTime.toIso8601String(),
    "name": name,
    "description": description,
  };
}

class Public {
  Public({
    required this.startDateTime,
    required this.startTbd,
    required this.startTba,
    required this.endDateTime,
  });

  DateTime startDateTime;
  bool startTbd;
  bool startTba;
  DateTime endDateTime;

  factory Public.fromJson(Map<String, dynamic> json) => Public(
    startDateTime: DateTime.parse(json["startDateTime"]),
    startTbd: json["startTBD"],
    startTba: json["startTBA"],
    endDateTime: DateTime.parse(json["endDateTime"]),
  );

  Map<String, dynamic> toJson() => {
    "startDateTime": startDateTime.toIso8601String(),
    "startTBD": startTbd,
    "startTBA": startTba,
    "endDateTime": endDateTime.toIso8601String(),
  };
}

class Seatmap {
  Seatmap({
    required this.staticUrl,
  });

  String staticUrl;

  factory Seatmap.fromJson(Map<String, dynamic> json) => Seatmap(
    staticUrl: json["staticUrl"],
  );

  Map<String, dynamic> toJson() => {
    "staticUrl": staticUrl,
  };
}

class TicketLimit {
  TicketLimit({
    required this.info,
  });

  String info;

  factory TicketLimit.fromJson(Map<String, dynamic> json) => TicketLimit(
    info: json["info"],
  );

  Map<String, dynamic> toJson() => {
    "info": info,
  };
}

class Ticketing {
  Ticketing({
    required this.safeTix,
  });

  SafeTix safeTix;

  factory Ticketing.fromJson(Map<String, dynamic> json) => Ticketing(
    safeTix: SafeTix.fromJson(json["safeTix"]),
  );

  Map<String, dynamic> toJson() => {
    "safeTix": safeTix.toJson(),
  };
}

class SafeTix {
  SafeTix({
    required this.enabled,
  });

  bool enabled;

  factory SafeTix.fromJson(Map<String, dynamic> json) => SafeTix(
    enabled: json["enabled"],
  );

  Map<String, dynamic> toJson() => {
    "enabled": enabled,
  };
}

enum EventType { EVENT }

final eventTypeValues = EnumValues({
  "event": EventType.EVENT
});

class EventModelLinks {
  EventModelLinks({
    required this.first,
    required this.self,
    required this.next,
    required this.last,
  });

  First first;
  First self;
  First next;
  First last;

  factory EventModelLinks.fromJson(Map<String, dynamic> json) => EventModelLinks(
    first: First.fromJson(json["first"]),
    self: First.fromJson(json["self"]),
    next: First.fromJson(json["next"]),
    last: First.fromJson(json["last"]),
  );

  Map<String, dynamic> toJson() => {
    "first": first.toJson(),
    "self": self.toJson(),
    "next": next.toJson(),
    "last": last.toJson(),
  };
}

class Page {
  Page({
    required this.size,
    required this.totalElements,
    required this.totalPages,
    required this.number,
  });

  int size;
  int totalElements;
  int totalPages;
  int number;

  factory Page.fromJson(Map<String, dynamic> json) => Page(
    size: json["size"],
    totalElements: json["totalElements"],
    totalPages: json["totalPages"],
    number: json["number"],
  );

  Map<String, dynamic> toJson() => {
    "size": size,
    "totalElements": totalElements,
    "totalPages": totalPages,
    "number": number,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
