cask "default-browser-router" do
  version "0.0.1"
  sha256 "aae63f4d8942f4cf66ef6660cbbe7a2c4f734e295c9a9f5bdc84b1a455ddbde6"

  url "https://github.com/eugenetaranov/default-browser/releases/download/v#{version}/DefaultBrowserRouter.zip"
  name "Default Browser Router"
  desc "Routes links to different browsers by YAML rules"
  homepage "https://github.com/eugenetaranov/default-browser"

  depends_on macos: ">= :ventura"

  app "DefaultBrowserRouter.app"

  caveats <<~CAVEATS
    This build is ad-hoc signed (not notarized). Install without quarantine:
      brew install --cask --no-quarantine default-browser-router

    Default Browser Router runs from the menu bar (a link icon) — no window.
    First run:
      1. open -a "Default Browser Router"
      2. Confirm the "make this your default browser?" prompt, or set it in
         System Settings -> Desktop & Dock -> Default web browser.
      3. Edit rules at ~/.config/default-browser-router/config.yaml
  CAVEATS
end
