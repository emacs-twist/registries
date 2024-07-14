{
  inputs = {
    melpa.url = "github:melpa/melpa";
    melpa.flake = false;

    gnu-elpa.url = "git+https://git.savannah.gnu.org/git/emacs/elpa.git?ref=main";
    gnu-elpa.flake = false;

    nongnu-elpa.url = "git+https://git.savannah.gnu.org/git/emacs/nongnu.git?ref=main";
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
