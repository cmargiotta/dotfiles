{ stdenv
, lib
, fetchzip
, alsa-lib
, autoPatchelfHook
, gst_all_1
, libpulseaudio
, qtbase
, pkgs
, openssl_1_1
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "chitubox";
  version = "1.9.5";

  src = fetchzip {
    url = "https://sac.chitubox.com/software/download.do?softwareId=17839&softwareVersionId=v${finalAttrs.version}&fileName=CHITUBOX_V${finalAttrs.version}.tar.gz";
    stripRoot = false;
    hash = "sha256-eTg6C4lnOwACbt7V5uTXpQWE1iIUyhdg4VyCJUtSn8E=";
  };

  #dontStrip = true;

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  runtimeDependencies = [ "/nix/store/3cvbzm2qviq00h97cmc9234ikwiyw5r2-openssl-1.1.1v/lib "];

  buildInputs = [
    alsa-lib
    gst_all_1.gst-plugins-base
    libpulseaudio
    pkgs.makeWrapper
  ] ++ qtbase.buildInputs ++ qtbase.propagatedBuildInputs;

  buildPhase = ''
    mkdir -p bin
    mv CHITUBOX bin/chitubox

    # Remove unused stuff
    rm AppRun

    # Place resources where ChiTuBox can expect to find them
    mkdir chitubox
    mv resource chitubox/

    # Configure Qt paths
    cat << EOF > bin/qt.conf
      [Paths]
      Prefix = $out
      Plugins = plugins
      Imports = qml
      Qml2Imports = qml
    EOF
  '';

  installPhase = ''
    mkdir -p $out
    mv * $out/

    wrapProgram $out/bin/chitubox \
      --unset QT_PLUGIN_PATH \
      --unset QML2_IMPORT_PATH
  '';

  meta = {
    description = "A Revolutionary Tool to Change 3D Printing Processes within One Click";
    homepage = "https://www.chitubox.com";
    license = {
      fullName = "ChiTuBox EULA";
      shortName = "ChiTuBox";
      url = "https://www.chitubox.com";
    };
		platforms = [ "x86_64-linux" ];
  };
})
