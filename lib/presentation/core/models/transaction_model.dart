class transactions {
  String pair,lastPrice, chg;
  transactions({required this.pair, required this.lastPrice, required this.chg});
}

List<transactions> transactionsList = [
transactions(
  pair: "GRS",
  lastPrice: "0.000013278",
  chg: "+114.26%"
),
transactions(
  pair: "VIA",
  lastPrice: "0.00001319",
  chg: "+38.12%"
),
transactions(
  pair: "STORJ",
  lastPrice: "0.000007024",
  chg: "+19.29%"
),
transactions(
  pair: "CMT",
  lastPrice: "0.00000946",
  chg: "+17.22%"
),
transactions(
  pair: "GXS",
  lastPrice: "0.0002294",
  chg: "+9.92%"
),
transactions(
  pair: "GNT",
  lastPrice: "0.0002042",
  chg: "+8.32%"
),
transactions(
  pair: "EOS",
  lastPrice: "0.0003313",
  chg: "+5.92%"
),
transactions(
  pair: "SNT",
  lastPrice: "0.0016850",
  chg: "+4.00%"
),
transactions(
  pair: "BEE",
  lastPrice: "0.0002294",
  chg: "+2.92%"
),

transactions(
  pair: "BTT",
  lastPrice: "0.0001252",
  chg: "+1.92%"
),
];