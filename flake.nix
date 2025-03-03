{
  inputs = {
    melpa.url = "github:melpa/melpa";
    melpa.flake = false;

    gnu-elpa.url = "github:elpa-mirrors/elpa";
    gnu-elpa.flake = false;

    nongnu-elpa.url = "github:elpa-mirrors/nongnu";
    nongnu-elpa.flake = false;
  };

  outputs = {...} @ inputs: {
    lib.registries = [
      {
        type = "melpa";
        path = inputs.melpa.outPath + "/recipes";
      }
      {
        type = "elpa";
        path = inputs.gnu-elpa.outPath + "/elpa-packages";
        auto-sync-only = true;
      }
      {
        type = "archive";
        url = "https://elpa.gnu.org/packages/";
      }
      {
        type = "elpa";
        path = inputs.nongnu-elpa.outPath + "/elpa-packages";
      }
      {
        type = "archive";
        url = "https://elpa.nongnu.org/nongnu/";
      }
    ];
  };
}
