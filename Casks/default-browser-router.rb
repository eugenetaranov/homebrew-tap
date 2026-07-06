cask "default-browser-router" do
  version "0.0.3"
  sha256 "c71ea1deee1964342fc45b878d7558cae0e217326dc63b13ed235082b7224463"

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
