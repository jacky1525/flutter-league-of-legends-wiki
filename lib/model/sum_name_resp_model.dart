class SummonerNameResp {
  final String id;
  final String accountId;
  final String puuid;
  final String name;
  final int profileIconId;
  final int revisionDate;
  final int summonerLevel;

  SummonerNameResp({
    required this.id,
    required this.accountId,
    required this.puuid,
    required this.name,
    required this.profileIconId,
    required this.revisionDate,
    required this.summonerLevel,
  });

  factory SummonerNameResp.fromJson(Map<String, dynamic> json) {
    return SummonerNameResp(
      id: json['id'],
      accountId: json['accountId'],
      puuid: json['puuid'],
      name: json['name'],
      profileIconId: json['profileIconId'],
      revisionDate: json['revisionDate'],
      summonerLevel: json['summonerLevel'],
    );
  }

  factory SummonerNameResp.empty() {
    return SummonerNameResp(
      id: "",
      accountId: "",
      puuid: "",
      name: "",
      profileIconId: 0,
      revisionDate: 0,
      summonerLevel: 0,
    );
  }
}
