{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, wrapGAppsHook
, gtk3
, librsvg
, withWayland ? false
, gtk-layer-shell
, stdenv
}:

rustPlatform.buildRustPackage rec {
  pname = "eww";
  version = "unstable-2023-08-18";

  src = fetchFromGitHub {
    owner = "elkowar";
    repo = "eww";
    rev = "387d344690903949121040f8a892f946e323c472";
    hash = "sha256-GEysmNDm+olt1WXHzRwb4ZLifkXmeP5+APAN3b81/Og=";
  };

  cargoHash = "sha256-4yeu5AgleZMOLKNynGMd0XuyZxyyZ+RmzNtuJiNPN8g=";

  nativeBuildInputs = [ pkg-config wrapGAppsHook ];

  buildInputs = [ gtk3 librsvg gtk-layer-shell ];

  cargoBuildFlags = [ "--bin" "eww" ];

  cargoTestFlags = cargoBuildFlags;

  # requires unstable rust features
  RUSTC_BOOTSTRAP = 1;

  meta = with lib; {
    description = "ElKowars wacky widgets";
    homepage = "https://github.com/elkowar/eww";
    license = licenses.mit;
    maintainers = with maintainers; [ figsoda lom ];
    mainProgram = "eww";
    broken = stdenv.isDarwin;
  };
}
