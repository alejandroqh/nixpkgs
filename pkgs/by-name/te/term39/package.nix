{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  pam,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "term39";
  version = "1.5.2";
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "alejandroqh";
    repo = "term39";
    tag = "v${finalAttrs.version}";
    hash = "sha256-DjseOO3oSNdsYvl+L+x9g45cwwbEWKf33w5CIj/iEI4=";
  };

  cargoHash = "sha256-W6kYUEYsbic+Oc0CVYjrb1q35jJkuzd9ierPeMWDPXs=";

  nativeBuildInputs = [
    pkg-config
    rustPlatform.bindgenHook
  ];

  buildInputs = [
    pam
  ];

  meta = {
    description = "Modern, retro-styled terminal multiplexer with a classic MS-DOS aesthetic";
    homepage = "https://github.com/alejandroqh/term39";
    changelog = "https://github.com/alejandroqh/term39/releases/tag/v${finalAttrs.version}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ alejandroqh ];
    mainProgram = "term39";
    platforms = lib.platforms.linux;
  };
})
