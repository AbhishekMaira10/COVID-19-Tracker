class Ticases {
  var total;
  var discharged;
  var deaths;
  var confirmedCasesIndian;
  var confirmedCasesForeign;
  var confirmedButLocationUnidentified;

  Ticases(
      {this.total,
      this.discharged,
      this.deaths,
      this.confirmedCasesIndian,
      this.confirmedCasesForeign,
      this.confirmedButLocationUnidentified});

  factory Ticases.fromJson(final json) {
    return Ticases(
        total: json["total"],
        discharged: json["discharged"],
        deaths: json["deaths"],
        confirmedCasesIndian: json["confirmedCasesIndian"],
        confirmedCasesForeign: json["confirmedCasesForeign"],
        confirmedButLocationUnidentified:
            json["confirmedButLocationUnidentified"]);
  }
}
