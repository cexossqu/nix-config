final: prev: {
  xh-fcitx5-rime = prev.fcitx5-rime.override {
    rimeDataPkgs = [
         ./fly-rime-data
      ];
  };
}
