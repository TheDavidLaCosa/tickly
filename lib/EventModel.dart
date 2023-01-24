class EventModel {
  EventModel({
    required this.embedded,
    required this.links,
    required this.page,
  });

  final EventModelEmbedded? embedded;
  final EventModelLinks? links;
  final Page? page;

  factory EventModel.fromJson(Map<String, dynamic> json){
    return EventModel(
      embedded: json["_embedded"] == null ? null : EventModelEmbedded.fromJson(json["_embedded"]),
      links: json["_links"] == null ? null : EventModelLinks.fromJson(json["_links"]),
      page: json["page"] == null ? null : Page.fromJson(json["page"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "_embedded": embedded?.toJson(),
    "_links": links?.toJson(),
    "page": page?.toJson(),
  };

}

class EventModelEmbedded {
  EventModelEmbedded({
    required this.events,
  });

  final List<Event> events;

  factory EventModelEmbedded.fromJson(Map<String, dynamic> json){
    return EventModelEmbedded(
      events: json["events"] == null ? [] : List<Event>.from(json["events"]!.map((x) => Event.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "events": events.map((x) => x?.toJson()).toList(),
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
    required this.promoter,
    required this.promoters,
    required this.priceRanges,
    required this.accessibility,
    required this.ticketLimit,
    required this.ageRestrictions,
    required this.ticketing,
    required this.links,
    required this.embedded,
    required this.pleaseNote,
    required this.seatmap,
    required this.doorsTimes,
    required this.info,
    required this.outlets,
  });

  final String? name;
  final String? type;
  final String? id;
  final bool? test;
  final String? url;
  final String? locale;
  final List<Image> images;
  final Sales? sales;
  final Dates? dates;
  final List<Classification> classifications;
  final Promoter? promoter;
  final List<Promoter> promoters;
  final List<PriceRange> priceRanges;
  final Accessibility? accessibility;
  final TicketLimit? ticketLimit;
  final AgeRestrictions? ageRestrictions;
  final Ticketing? ticketing;
  final EventLinks? links;
  final EventEmbedded? embedded;
  final String? pleaseNote;
  final Seatmap? seatmap;
  final DoorsTimes? doorsTimes;
  final String? info;
  final List<Outlet> outlets;

  factory Event.fromJson(Map<String, dynamic> json){
    return Event(
      name: json["name"],
      type: json["type"],
      id: json["id"],
      test: json["test"],
      url: json["url"],
      locale: json["locale"],
      images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
      sales: json["sales"] == null ? null : Sales.fromJson(json["sales"]),
      dates: json["dates"] == null ? null : Dates.fromJson(json["dates"]),
      classifications: json["classifications"] == null ? [] : List<Classification>.from(json["classifications"]!.map((x) => Classification.fromJson(x))),
      promoter: json["promoter"] == null ? null : Promoter.fromJson(json["promoter"]),
      promoters: json["promoters"] == null ? [] : List<Promoter>.from(json["promoters"]!.map((x) => Promoter.fromJson(x))),
      priceRanges: json["priceRanges"] == null ? [] : List<PriceRange>.from(json["priceRanges"]!.map((x) => PriceRange.fromJson(x))),
      accessibility: json["accessibility"] == null ? null : Accessibility.fromJson(json["accessibility"]),
      ticketLimit: json["ticketLimit"] == null ? null : TicketLimit.fromJson(json["ticketLimit"]),
      ageRestrictions: json["ageRestrictions"] == null ? null : AgeRestrictions.fromJson(json["ageRestrictions"]),
      ticketing: json["ticketing"] == null ? null : Ticketing.fromJson(json["ticketing"]),
      links: json["_links"] == null ? null : EventLinks.fromJson(json["_links"]),
      embedded: json["_embedded"] == null ? null : EventEmbedded.fromJson(json["_embedded"]),
      pleaseNote: json["pleaseNote"],
      seatmap: json["seatmap"] == null ? null : Seatmap.fromJson(json["seatmap"]),
      doorsTimes: json["doorsTimes"] == null ? null : DoorsTimes.fromJson(json["doorsTimes"]),
      info: json["info"],
      outlets: json["outlets"] == null ? [] : List<Outlet>.from(json["outlets"]!.map((x) => Outlet.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "id": id,
    "test": test,
    "url": url,
    "locale": locale,
    "images": images.map((x) => x?.toJson()).toList(),
    "sales": sales?.toJson(),
    "dates": dates?.toJson(),
    "classifications": classifications.map((x) => x?.toJson()).toList(),
    "promoter": promoter?.toJson(),
    "promoters": promoters.map((x) => x?.toJson()).toList(),
    "priceRanges": priceRanges.map((x) => x?.toJson()).toList(),
    "accessibility": accessibility?.toJson(),
    "ticketLimit": ticketLimit?.toJson(),
    "ageRestrictions": ageRestrictions?.toJson(),
    "ticketing": ticketing?.toJson(),
    "_links": links?.toJson(),
    "_embedded": embedded?.toJson(),
    "pleaseNote": pleaseNote,
    "seatmap": seatmap?.toJson(),
    "doorsTimes": doorsTimes?.toJson(),
    "info": info,
    "outlets": outlets.map((x) => x?.toJson()).toList(),
  };

}

class Accessibility {
  Accessibility({
    required this.ticketLimit,
    required this.info,
  });

  final int? ticketLimit;
  final String? info;

  factory Accessibility.fromJson(Map<String, dynamic> json){
    return Accessibility(
      ticketLimit: json["ticketLimit"],
      info: json["info"],
    );
  }

  Map<String, dynamic> toJson() => {
    "ticketLimit": ticketLimit,
    "info": info,
  };

}

class AgeRestrictions {
  AgeRestrictions({
    required this.legalAgeEnforced,
    required this.ageRuleDescription,
  });

  final bool? legalAgeEnforced;
  final String? ageRuleDescription;

  factory AgeRestrictions.fromJson(Map<String, dynamic> json){
    return AgeRestrictions(
      legalAgeEnforced: json["legalAgeEnforced"],
      ageRuleDescription: json["ageRuleDescription"],
    );
  }

  Map<String, dynamic> toJson() => {
    "legalAgeEnforced": legalAgeEnforced,
    "ageRuleDescription": ageRuleDescription,
  };

}

class Classification {
  Classification({
    required this.primary,
    required this.segment,
    required this.genre,
    required this.subGenre,
    required this.type,
    required this.subType,
    required this.family,
  });

  final bool? primary;
  final Genre? segment;
  final Genre? genre;
  final Genre? subGenre;
  final Genre? type;
  final Genre? subType;
  final bool? family;

  factory Classification.fromJson(Map<String, dynamic> json){
    return Classification(
      primary: json["primary"],
      segment: json["segment"] == null ? null : Genre.fromJson(json["segment"]),
      genre: json["genre"] == null ? null : Genre.fromJson(json["genre"]),
      subGenre: json["subGenre"] == null ? null : Genre.fromJson(json["subGenre"]),
      type: json["type"] == null ? null : Genre.fromJson(json["type"]),
      subType: json["subType"] == null ? null : Genre.fromJson(json["subType"]),
      family: json["family"],
    );
  }

  Map<String, dynamic> toJson() => {
    "primary": primary,
    "segment": segment?.toJson(),
    "genre": genre?.toJson(),
    "subGenre": subGenre?.toJson(),
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

  final String? id;
  final String? name;

  factory Genre.fromJson(Map<String, dynamic> json){
    return Genre(
      id: json["id"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };

}

class Dates {
  Dates({
    required this.start,
    required this.timezone,
    required this.status,
    required this.spanMultipleDays,
    required this.access,
  });

  final Start? start;
  final String? timezone;
  final Status? status;
  final bool? spanMultipleDays;
  final Access? access;

  factory Dates.fromJson(Map<String, dynamic> json){
    return Dates(
      start: json["start"] == null ? null : Start.fromJson(json["start"]),
      timezone: json["timezone"],
      status: json["status"] == null ? null : Status.fromJson(json["status"]),
      spanMultipleDays: json["spanMultipleDays"],
      access: json["access"] == null ? null : Access.fromJson(json["access"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "start": start?.toJson(),
    "timezone": timezone,
    "status": status?.toJson(),
    "spanMultipleDays": spanMultipleDays,
    "access": access?.toJson(),
  };

}

class Access {
  Access({
    required this.startDateTime,
    required this.startApproximate,
    required this.endApproximate,
  });

  final DateTime? startDateTime;
  final bool? startApproximate;
  final bool? endApproximate;

  factory Access.fromJson(Map<String, dynamic> json){
    return Access(
      startDateTime: json["startDateTime"] == null ? null : DateTime.parse(json["startDateTime"]),
      startApproximate: json["startApproximate"],
      endApproximate: json["endApproximate"],
    );
  }

  Map<String, dynamic> toJson() => {
    "startDateTime": startDateTime?.toIso8601String(),
    "startApproximate": startApproximate,
    "endApproximate": endApproximate,
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

  final DateTime? localDate;
  final String? localTime;
  final DateTime? dateTime;
  final bool? dateTbd;
  final bool? dateTba;
  final bool? timeTba;
  final bool? noSpecificTime;

  factory Start.fromJson(Map<String, dynamic> json){
    return Start(
      localDate: json["localDate"] == null ? null : DateTime.parse(json["localDate"]),
      localTime: json["localTime"],
      dateTime: json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
      dateTbd: json["dateTBD"],
      dateTba: json["dateTBA"],
      timeTba: json["timeTBA"],
      noSpecificTime: json["noSpecificTime"],
    );
  }

  Map<String, dynamic> toJson() => {
    "localTime": localTime,
    "dateTime": dateTime?.toIso8601String(),
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

  final String? code;

  factory Status.fromJson(Map<String, dynamic> json){
    return Status(
      code: json["code"],
    );
  }

  Map<String, dynamic> toJson() => {
    "code": code,
  };

}

class DoorsTimes {
  DoorsTimes({
    required this.localDate,
    required this.localTime,
    required this.dateTime,
  });

  final DateTime? localDate;
  final String? localTime;
  final DateTime? dateTime;

  factory DoorsTimes.fromJson(Map<String, dynamic> json){
    return DoorsTimes(
      localDate: json["localDate"] == null ? null : DateTime.parse(json["localDate"]),
      localTime: json["localTime"],
      dateTime: json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "localTime": localTime,
    "dateTime": dateTime?.toIso8601String(),
  };

}

class EventEmbedded {
  EventEmbedded({
    required this.venues,
    required this.attractions,
  });

  final List<Venue> venues;
  final List<Attraction> attractions;

  factory EventEmbedded.fromJson(Map<String, dynamic> json){
    return EventEmbedded(
      venues: json["venues"] == null ? [] : List<Venue>.from(json["venues"]!.map((x) => Venue.fromJson(x))),
      attractions: json["attractions"] == null ? [] : List<Attraction>.from(json["attractions"]!.map((x) => Attraction.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "venues": venues.map((x) => x?.toJson()).toList(),
    "attractions": attractions.map((x) => x?.toJson()).toList(),
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
    required this.images,
    required this.classifications,
    required this.upcomingEvents,
    required this.links,
    required this.externalLinks,
  });

  final String? name;
  final String? type;
  final String? id;
  final bool? test;
  final String? url;
  final String? locale;
  final List<Image> images;
  final List<Classification> classifications;
  final UpcomingEvents? upcomingEvents;
  final AttractionLinks? links;
  final ExternalLinks? externalLinks;

  factory Attraction.fromJson(Map<String, dynamic> json){
    return Attraction(
      name: json["name"],
      type: json["type"],
      id: json["id"],
      test: json["test"],
      url: json["url"],
      locale: json["locale"],
      images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
      classifications: json["classifications"] == null ? [] : List<Classification>.from(json["classifications"]!.map((x) => Classification.fromJson(x))),
      upcomingEvents: json["upcomingEvents"] == null ? null : UpcomingEvents.fromJson(json["upcomingEvents"]),
      links: json["_links"] == null ? null : AttractionLinks.fromJson(json["_links"]),
      externalLinks: json["externalLinks"] == null ? null : ExternalLinks.fromJson(json["externalLinks"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "id": id,
    "test": test,
    "url": url,
    "locale": locale,
    "images": images.map((x) => x?.toJson()).toList(),
    "classifications": classifications.map((x) => x?.toJson()).toList(),
    "upcomingEvents": upcomingEvents?.toJson(),
    "_links": links?.toJson(),
    "externalLinks": externalLinks?.toJson(),
  };

}

class ExternalLinks {
  ExternalLinks({
    required this.musicbrainz,
    required this.homepage,
  });

  final List<Musicbrainz> musicbrainz;
  final List<Homepage> homepage;

  factory ExternalLinks.fromJson(Map<String, dynamic> json){
    return ExternalLinks(
      musicbrainz: json["musicbrainz"] == null ? [] : List<Musicbrainz>.from(json["musicbrainz"]!.map((x) => Musicbrainz.fromJson(x))),
      homepage: json["homepage"] == null ? [] : List<Homepage>.from(json["homepage"]!.map((x) => Homepage.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "musicbrainz": musicbrainz.map((x) => x?.toJson()).toList(),
    "homepage": homepage.map((x) => x?.toJson()).toList(),
  };

}

class Homepage {
  Homepage({
    required this.url,
  });

  final String? url;

  factory Homepage.fromJson(Map<String, dynamic> json){
    return Homepage(
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {
    "url": url,
  };

}

class Musicbrainz {
  Musicbrainz({
    required this.id,
  });

  final String? id;

  factory Musicbrainz.fromJson(Map<String, dynamic> json){
    return Musicbrainz(
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
  };

}

class Image {
  Image({
    required this.ratio,
    required this.url,
    required this.width,
    required this.height,
    required this.fallback,
    required this.attribution,
  });

  final String? ratio;
  final String? url;
  final int? width;
  final int? height;
  final bool? fallback;
  final String? attribution;

  factory Image.fromJson(Map<String, dynamic> json){
    return Image(
      ratio: json["ratio"],
      url: json["url"],
      width: json["width"],
      height: json["height"],
      fallback: json["fallback"],
      attribution: json["attribution"],
    );
  }

  Map<String, dynamic> toJson() => {
    "ratio": ratio,
    "url": url,
    "width": width,
    "height": height,
    "fallback": fallback,
    "attribution": attribution,
  };

}

class AttractionLinks {
  AttractionLinks({
    required this.self,
  });

  final First? self;

  factory AttractionLinks.fromJson(Map<String, dynamic> json){
    return AttractionLinks(
      self: json["self"] == null ? null : First.fromJson(json["self"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "self": self?.toJson(),
  };

}

class First {
  First({
    required this.href,
  });

  final String? href;

  factory First.fromJson(Map<String, dynamic> json){
    return First(
      href: json["href"],
    );
  }

  Map<String, dynamic> toJson() => {
    "href": href,
  };

}

class UpcomingEvents {
  UpcomingEvents({
    required this.total,
    required this.ticketmaster,
    required this.filtered,
    required this.mfxCh,
    required this.tmr,
  });

  final int? total;
  final int? ticketmaster;
  final int? filtered;
  final int? mfxCh;
  final int? tmr;

  factory UpcomingEvents.fromJson(Map<String, dynamic> json){
    return UpcomingEvents(
      total: json["_total"],
      ticketmaster: json["ticketmaster"],
      filtered: json["_filtered"],
      mfxCh: json["mfx-ch"],
      tmr: json["tmr"],
    );
  }

  Map<String, dynamic> toJson() => {
    "_total": total,
    "ticketmaster": ticketmaster,
    "_filtered": filtered,
    "mfx-ch": mfxCh,
    "tmr": tmr,
  };

}

class Venue {
  Venue({
    required this.name,
    required this.type,
    required this.id,
    required this.test,
    required this.url,
    required this.locale,
    required this.timezone,
    required this.city,
    required this.country,
    required this.address,
    required this.location,
    required this.markets,
    required this.dmas,
    required this.upcomingEvents,
    required this.ada,
    required this.links,
    required this.postalCode,
    required this.state,
    required this.boxOfficeInfo,
    required this.parkingDetail,
    required this.accessibleSeatingDetail,
    required this.generalInfo,
    required this.images,
  });

  final String? name;
  final String? type;
  final String? id;
  final bool? test;
  final String? url;
  final String? locale;
  final String? timezone;
  final City? city;
  final Country? country;
  final Address? address;
  final Location? location;
  final List<Genre> markets;
  final List<Dma> dmas;
  final UpcomingEvents? upcomingEvents;
  final Ada? ada;
  final AttractionLinks? links;
  final String? postalCode;
  final StateVar? state;
  final BoxOfficeInfo? boxOfficeInfo;
  final String? parkingDetail;
  final String? accessibleSeatingDetail;
  final GeneralInfo? generalInfo;
  final List<Image> images;

  factory Venue.fromJson(Map<String, dynamic> json){
    return Venue(
      name: json["name"],
      type: json["type"],
      id: json["id"],
      test: json["test"],
      url: json["url"],
      locale: json["locale"],
      timezone: json["timezone"],
      city: json["city"] == null ? null : City.fromJson(json["city"]),
      country: json["country"] == null ? null : Country.fromJson(json["country"]),
      address: json["address"] == null ? null : Address.fromJson(json["address"]),
      location: json["location"] == null ? null : Location.fromJson(json["location"]),
      markets: json["markets"] == null ? [] : List<Genre>.from(json["markets"]!.map((x) => Genre.fromJson(x))),
      dmas: json["dmas"] == null ? [] : List<Dma>.from(json["dmas"]!.map((x) => Dma.fromJson(x))),
      upcomingEvents: json["upcomingEvents"] == null ? null : UpcomingEvents.fromJson(json["upcomingEvents"]),
      ada: json["ada"] == null ? null : Ada.fromJson(json["ada"]),
      links: json["_links"] == null ? null : AttractionLinks.fromJson(json["_links"]),
      postalCode: json["postalCode"],
      state: json["state"] == null ? null : StateVar.fromJson(json["state"]),
      boxOfficeInfo: json["boxOfficeInfo"] == null ? null : BoxOfficeInfo.fromJson(json["boxOfficeInfo"]),
      parkingDetail: json["parkingDetail"],
      accessibleSeatingDetail: json["accessibleSeatingDetail"],
      generalInfo: json["generalInfo"] == null ? null : GeneralInfo.fromJson(json["generalInfo"]),
      images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "id": id,
    "test": test,
    "url": url,
    "locale": locale,
    "timezone": timezone,
    "city": city?.toJson(),
    "country": country?.toJson(),
    "address": address?.toJson(),
    "location": location?.toJson(),
    "markets": markets.map((x) => x?.toJson()).toList(),
    "dmas": dmas.map((x) => x?.toJson()).toList(),
    "upcomingEvents": upcomingEvents?.toJson(),
    "ada": ada?.toJson(),
    "_links": links?.toJson(),
    "postalCode": postalCode,
    "state": state?.toJson(),
    "boxOfficeInfo": boxOfficeInfo?.toJson(),
    "parkingDetail": parkingDetail,
    "accessibleSeatingDetail": accessibleSeatingDetail,
    "generalInfo": generalInfo?.toJson(),
    "images": images.map((x) => x?.toJson()).toList(),
  };

}

class Ada {
  Ada({
    required this.adaPhones,
    required this.adaCustomCopy,
    required this.adaHours,
  });

  final String? adaPhones;
  final String? adaCustomCopy;
  final String? adaHours;

  factory Ada.fromJson(Map<String, dynamic> json){
    return Ada(
      adaPhones: json["adaPhones"],
      adaCustomCopy: json["adaCustomCopy"],
      adaHours: json["adaHours"],
    );
  }

  Map<String, dynamic> toJson() => {
    "adaPhones": adaPhones,
    "adaCustomCopy": adaCustomCopy,
    "adaHours": adaHours,
  };

}

class Address {
  Address({
    required this.line1,
  });

  final String? line1;

  factory Address.fromJson(Map<String, dynamic> json){
    return Address(
      line1: json["line1"],
    );
  }

  Map<String, dynamic> toJson() => {
    "line1": line1,
  };

}

class BoxOfficeInfo {
  BoxOfficeInfo({
    required this.phoneNumberDetail,
    required this.acceptedPaymentDetail,
    required this.willCallDetail,
    required this.openHoursDetail,
  });

  final String? phoneNumberDetail;
  final String? acceptedPaymentDetail;
  final String? willCallDetail;
  final String? openHoursDetail;

  factory BoxOfficeInfo.fromJson(Map<String, dynamic> json){
    return BoxOfficeInfo(
      phoneNumberDetail: json["phoneNumberDetail"],
      acceptedPaymentDetail: json["acceptedPaymentDetail"],
      willCallDetail: json["willCallDetail"],
      openHoursDetail: json["openHoursDetail"],
    );
  }

  Map<String, dynamic> toJson() => {
    "phoneNumberDetail": phoneNumberDetail,
    "acceptedPaymentDetail": acceptedPaymentDetail,
    "willCallDetail": willCallDetail,
    "openHoursDetail": openHoursDetail,
  };

}

class City {
  City({
    required this.name,
  });

  final String? name;

  factory City.fromJson(Map<String, dynamic> json){
    return City(
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
  };

}

class Country {
  Country({
    required this.name,
    required this.countryCode,
  });

  final String? name;
  final String? countryCode;

  factory Country.fromJson(Map<String, dynamic> json){
    return Country(
      name: json["name"],
      countryCode: json["countryCode"],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "countryCode": countryCode,
  };

}

class Dma {
  Dma({
    required this.id,
  });

  final int? id;

  factory Dma.fromJson(Map<String, dynamic> json){
    return Dma(
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
  };

}

class GeneralInfo {
  GeneralInfo({
    required this.childRule,
    required this.generalRule,
  });

  final String? childRule;
  final String? generalRule;

  factory GeneralInfo.fromJson(Map<String, dynamic> json){
    return GeneralInfo(
      childRule: json["childRule"],
      generalRule: json["generalRule"],
    );
  }

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

  final String? longitude;
  final String? latitude;

  factory Location.fromJson(Map<String, dynamic> json){
    return Location(
      longitude: json["longitude"],
      latitude: json["latitude"],
    );
  }

  Map<String, dynamic> toJson() => {
    "longitude": longitude,
    "latitude": latitude,
  };

}

class StateVar {
  StateVar({
    required this.name,
    required this.stateCode,
  });

  final String? name;
  final String? stateCode;

  factory StateVar.fromJson(Map<String, dynamic> json){
    return StateVar(
      name: json["name"],
      stateCode: json["stateCode"],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "stateCode": stateCode,
  };

}

class EventLinks {
  EventLinks({
    required this.self,
    required this.attractions,
    required this.venues,
  });

  final First? self;
  final List<First> attractions;
  final List<First> venues;

  factory EventLinks.fromJson(Map<String, dynamic> json){
    return EventLinks(
      self: json["self"] == null ? null : First.fromJson(json["self"]),
      attractions: json["attractions"] == null ? [] : List<First>.from(json["attractions"]!.map((x) => First.fromJson(x))),
      venues: json["venues"] == null ? [] : List<First>.from(json["venues"]!.map((x) => First.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "self": self?.toJson(),
    "attractions": attractions.map((x) => x?.toJson()).toList(),
    "venues": venues.map((x) => x?.toJson()).toList(),
  };

}

class Outlet {
  Outlet({
    required this.url,
    required this.type,
  });

  final String? url;
  final String? type;

  factory Outlet.fromJson(Map<String, dynamic> json){
    return Outlet(
      url: json["url"],
      type: json["type"],
    );
  }

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

  final String? type;
  final String? currency;
  final double? min;
  final double? max;

  factory PriceRange.fromJson(Map<String, dynamic> json){
    return PriceRange(
      type: json["type"],
      currency: json["currency"],
      min: json["min"],
      max: json["max"],
    );
  }

  Map<String, dynamic> toJson() => {
    "type": type,
    "currency": currency,
    "min": min,
    "max": max,
  };

}

class Promoter {
  Promoter({
    required this.id,
    required this.name,
    required this.description,
  });

  final String? id;
  final String? name;
  final String? description;

  factory Promoter.fromJson(Map<String, dynamic> json){
    return Promoter(
      id: json["id"],
      name: json["name"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
  };

}

class Sales {
  Sales({
    required this.public,
    required this.presales,
  });

  final Public? public;
  final List<Presale> presales;

  factory Sales.fromJson(Map<String, dynamic> json){
    return Sales(
      public: json["public"] == null ? null : Public.fromJson(json["public"]),
      presales: json["presales"] == null ? [] : List<Presale>.from(json["presales"]!.map((x) => Presale.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "public": public?.toJson(),
    "presales": presales.map((x) => x?.toJson()).toList(),
  };

}

class Presale {
  Presale({
    required this.startDateTime,
    required this.endDateTime,
    required this.name,
  });

  final DateTime? startDateTime;
  final DateTime? endDateTime;
  final String? name;

  factory Presale.fromJson(Map<String, dynamic> json){
    return Presale(
      startDateTime: json["startDateTime"] == null ? null : DateTime.parse(json["startDateTime"]),
      endDateTime: json["endDateTime"] == null ? null : DateTime.parse(json["endDateTime"]),
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
    "startDateTime": startDateTime?.toIso8601String(),
    "endDateTime": endDateTime?.toIso8601String(),
    "name": name,
  };

}

class Public {
  Public({
    required this.startDateTime,
    required this.startTbd,
    required this.startTba,
    required this.endDateTime,
  });

  final DateTime? startDateTime;
  final bool? startTbd;
  final bool? startTba;
  final DateTime? endDateTime;

  factory Public.fromJson(Map<String, dynamic> json){
    return Public(
      startDateTime: json["startDateTime"] == null ? null : DateTime.parse(json["startDateTime"]),
      startTbd: json["startTBD"],
      startTba: json["startTBA"],
      endDateTime: json["endDateTime"] == null ? null : DateTime.parse(json["endDateTime"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "startDateTime": startDateTime?.toIso8601String(),
    "startTBD": startTbd,
    "startTBA": startTba,
    "endDateTime": endDateTime?.toIso8601String(),
  };

}

class Seatmap {
  Seatmap({
    required this.staticUrl,
  });

  final String? staticUrl;

  factory Seatmap.fromJson(Map<String, dynamic> json){
    return Seatmap(
      staticUrl: json["staticUrl"],
    );
  }

  Map<String, dynamic> toJson() => {
    "staticUrl": staticUrl,
  };

}

class TicketLimit {
  TicketLimit({
    required this.info,
  });

  final String? info;

  factory TicketLimit.fromJson(Map<String, dynamic> json){
    return TicketLimit(
      info: json["info"],
    );
  }

  Map<String, dynamic> toJson() => {
    "info": info,
  };

}

class Ticketing {
  Ticketing({
    required this.safeTix,
  });

  final SafeTix? safeTix;

  factory Ticketing.fromJson(Map<String, dynamic> json){
    return Ticketing(
      safeTix: json["safeTix"] == null ? null : SafeTix.fromJson(json["safeTix"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "safeTix": safeTix?.toJson(),
  };

}

class SafeTix {
  SafeTix({
    required this.enabled,
  });

  final bool? enabled;

  factory SafeTix.fromJson(Map<String, dynamic> json){
    return SafeTix(
      enabled: json["enabled"],
    );
  }

  Map<String, dynamic> toJson() => {
    "enabled": enabled,
  };

}

class EventModelLinks {
  EventModelLinks({
    required this.first,
    required this.self,
    required this.next,
    required this.last,
  });

  final First? first;
  final First? self;
  final First? next;
  final First? last;

  factory EventModelLinks.fromJson(Map<String, dynamic> json){
    return EventModelLinks(
      first: json["first"] == null ? null : First.fromJson(json["first"]),
      self: json["self"] == null ? null : First.fromJson(json["self"]),
      next: json["next"] == null ? null : First.fromJson(json["next"]),
      last: json["last"] == null ? null : First.fromJson(json["last"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "first": first?.toJson(),
    "self": self?.toJson(),
    "next": next?.toJson(),
    "last": last?.toJson(),
  };

}

class Page {
  Page({
    required this.size,
    required this.totalElements,
    required this.totalPages,
    required this.number,
  });

  final int? size;
  final int? totalElements;
  final int? totalPages;
  final int? number;

  factory Page.fromJson(Map<String, dynamic> json){
    return Page(
      size: json["size"],
      totalElements: json["totalElements"],
      totalPages: json["totalPages"],
      number: json["number"],
    );
  }

  Map<String, dynamic> toJson() => {
    "size": size,
    "totalElements": totalElements,
    "totalPages": totalPages,
    "number": number,
  };

}
