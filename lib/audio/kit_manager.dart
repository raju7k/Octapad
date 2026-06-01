class KitManager {
  String currentKit = "jazz";

  final Map<String, Map<String, String>> kits = {
    "jazz": {
      "Kick": "kick",
      "Snare": "snare",
      "Hat": "hihat",
      "FX": "clap",
    },
    "edm": {
      "Kick": "kick",
      "Snare": "snare",
      "Hat": "hihat",
      "FX": "clap",
    }
  };

  String getSound(String pad) {
    return kits[currentKit]?[pad] ?? "kick";
  }

  void switchKit() {
    currentKit = currentKit == "jazz" ? "edm" : "jazz";
  }
}