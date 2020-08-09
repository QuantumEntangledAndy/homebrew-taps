class Neolink < Formula
  desc "Neolink, an RTSP bridge for Reolink cameras"
  homepage "https://github.com/thirtythreeforty/neolink"
  url "https://github.com/thirtythreeforty/neolink/archive/v0.3.0.tar.gz"
  sha256 "338f6fb708a76deb940f0e34bd236fe6558b8fca55ecbc20e16365e2416f909a"
  license "AGPL-3.0-or-later"
  head "https://github.com/thirtythreeforty/neolink.git"

  depends_on "rust" => :build
  depends_on "glib"
  depends_on "gst-plugins-bad"
  depends_on "gst-plugins-base"
  depends_on "gst-plugins-good"
  depends_on "gst-rtsp-server"

  def install
    system "cargo", "install", "--all-features", *std_cargo_args
    pkgshare.install "sample_config.toml"
  end

  def caveats
    <<~EOS
      An example config file is provided in
        /usr/local/share/neolink/sample_config.toml
    EOS
  end

  test do
    system "neolink", "--help"
  end
end
