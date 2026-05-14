class Authgate < Formula
  include Language::Python::Virtualenv

  desc "Switch user-level CLI auth between named profiles (cloudflare, stripe, vercel, gh, doctl)"
  homepage "https://github.com/jbwashington/authgate"
  url "https://github.com/jbwashington/authgate/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "7deb153a43e2714fdbe5e9b0dc16f2cea8137e21873c74f9bb25579161aa2a93"
  license "MIT"
  head "https://github.com/jbwashington/authgate.git", branch: "main"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "stripe", shell_output("#{bin}/authgate services")
    assert_match "vercel", shell_output("#{bin}/authgate services")
  end
end
