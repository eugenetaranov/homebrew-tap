cask "default-browser-router" do
  version "0.0.7"
  sha256 "334e3e67cb0f03dec333a896892b786bcdc56ff357bab2ef2aa58ad5905491f2"

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
