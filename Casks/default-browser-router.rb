cask "default-browser-router" do
  version "0.0.2"
  sha256 "67b2d843ac22f4642130f8691d9f11ae7f5f094bd4a43d68ce5d07e9303d6b1b"

  url "https://github.com/eugenetaranov/default-browser/releases/download/v#{version}/DefaultBrowserRouter.zip"
  name "Default Browser Router"
  desc "Routes links to different browsers by YAML rules"
  homepage "https://github.com/eugenetaranov/default-browser"

  depends_on macos: :ventura

  app "DefaultBrowserRouter.app"

  caveats <<~CAVEATS
    This build is ad-hoc signed (not notarized). Clear the download quarantine,
    then launch it once (by path, since it isn't registered yet):
      xattr -dr com.apple.quarantine "#{appdir}/DefaultBrowserRouter.app"
      open "#{appdir}/DefaultBrowserRouter.app"

    Default Browser Router runs from the menu bar (a link icon) — no window.
    On first launch, confirm the "make this your default browser?" prompt, or set
    it in System Settings -> Desktop & Dock -> Default web browser.
    Edit rules at ~/.config/default-browser-router/config.yaml
  CAVEATS
end
