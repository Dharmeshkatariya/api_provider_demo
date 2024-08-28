class PropertyData {
  String? propertyName;
  String? accountType;
  String? checkOutTime;
  List<CommonDoors>? commonDoors;
  List<Buildings>? buildings;

  PropertyData(
      {this.propertyName,
      this.accountType,
      this.checkOutTime,
      this.commonDoors,
      this.buildings});

  PropertyData.fromJson(Map<String, dynamic> json) {
    propertyName = json['property_name'];
    accountType = json['account_type'];
    checkOutTime = json['check-out_time'];
    if (json['common_doors'] != null) {
      commonDoors = <CommonDoors>[];
      json['common_doors'].forEach((v) {
        commonDoors!.add(CommonDoors.fromJson(v));
      });
    }
    if (json['buildings'] != null) {
      buildings = <Buildings>[];
      json['buildings'].forEach((v) {
        buildings!.add(Buildings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['property_name'] = this.propertyName;
    data['account_type'] = this.accountType;
    data['check-out_time'] = this.checkOutTime;
    if (this.commonDoors != null) {
      data['common_doors'] = this.commonDoors!.map((v) => v.toJson()).toList();
    }
    if (this.buildings != null) {
      data['buildings'] = this.buildings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CommonDoors {
  String? doorName;
  String? locationDescription;

  CommonDoors({this.doorName, this.locationDescription});

  CommonDoors.fromJson(Map<String, dynamic> json) {
    doorName = json['door_name'];
    locationDescription = json['location_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['door_name'] = this.doorName;
    data['location_description'] = this.locationDescription;
    return data;
  }
}

class Buildings {
  String? buildingName;
  List<Floors>? floors;

  Buildings({this.buildingName, this.floors});

  Buildings.fromJson(Map<String, dynamic> json) {
    buildingName = json['building_name'];
    if (json['floors'] != null) {
      floors = <Floors>[];
      json['floors'].forEach((v) {
        floors!.add(Floors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['building_name'] = this.buildingName;
    if (this.floors != null) {
      data['floors'] = this.floors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Floors {
  String? floorNumber;
  List<Rooms>? rooms;

  Floors({this.floorNumber, this.rooms});

  Floors.fromJson(Map<String, dynamic> json) {
    floorNumber = json['floor_number'];
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(Rooms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['floor_number'] = this.floorNumber;
    if (this.rooms != null) {
      data['rooms'] = this.rooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rooms {
  String? roomName;
  String? keyTechnology;

  Rooms({this.roomName, this.keyTechnology});

  Rooms.fromJson(Map<String, dynamic> json) {
    roomName = json['room_name'];
    keyTechnology = json['key_technology'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['room_name'] = this.roomName;
    data['key_technology'] = this.keyTechnology;
    return data;
  }
}
