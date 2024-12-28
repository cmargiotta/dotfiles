{ lib
, config
, pkgs
, inputs
, ...
}:
let
  findDesktopFile = pkg:
    let
      desktop-path = "${pkg}/share/applications";
      files = builtins.attrNames (builtins.readDir desktop-path);
      desktop-files = lib.filter (f: lib.hasSuffix ".desktop" f) files;
    in
    if desktop-files != [ ] then
      "${lib.lists.last desktop-files}"
    else
      null;

  browser = findDesktopFile inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default;
  editor = "emacs.desktop";
  file-manager = findDesktopFile pkgs.nemo;
  image-viewer = findDesktopFile pkgs.gthumb;
in
{
  xdg = {
    mime.enable = true;

    userDirs = {
      enable = true;
      createDirectories = true;
    };

    mimeApps = {
      enable = true;

      defaultApplications = {
        "inode/directory" = file-manager;

        "x-scheme-handler/http" = browser;
        "x-scheme-handler/https" = browser;
        "x-scheme-handler/chrome" = browser;
        "application/xhtml+xml" = browser;
        "application/x-extension-htm" = browser;
        "application/x-extension-html" = browser;
        "application/x-extension-shtml" = browser;
        "application/x-extension-xhtml" = browser;
        "application/x-extension-xht" = browser;
        "text/html" = browser;
        "application/pdf" = browser;

        "application/x-shellscript" = editor;
        "selection.txt" = editor;

        "image/jpeg" = image-viewer;
        "image/bmp" = image-viewer;
        "image/gif" = image-viewer;
        "image/jpg" = image-viewer;
        "image/pjpeg" = image-viewer;
        "image/png" = image-viewer;
        "image/tiff" = image-viewer;
        "image/webp" = image-viewer;
        "image/x-bmp" = image-viewer;
        "image/x-gray" = image-viewer;
        "image/x-icb" = image-viewer;
        "image/x-ico" = image-viewer;
        "image/x-png" = image-viewer;
        "image/x-portable-anymap" = image-viewer;
        "image/x-portable-bitmap" = image-viewer;
        "image/x-portable-graymap" = image-viewer;
        "image/x-portable-pixmap" = image-viewer;
        "image/x-xbitmap" = image-viewer;
        "image/x-xpixmap" = image-viewer;
        "image/x-pcx" = image-viewer;
        "image/svg+xml" = image-viewer;
        "image/svg+xml-compressed" = image-viewer;
        "image/vnd.wap.wbmp" = image-viewer;
        "image/x-icns" = image-viewer;
      };
    };
  };
}
