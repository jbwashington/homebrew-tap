class Authgate < Formula
  include Language::Python::Virtualenv

  desc "Switch user-level CLI auth between named profiles (cloudflare, stripe, vercel, gh, doctl)"
  homepage "https://github.com/jbwashington/authgate"
  url "https://github.com/jbwashington/authgate/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "de53483e7f8e705e120aff273f9af84f93c87dba5500cb9258161f9d1d35b118"
  license "MIT"
  head "https://github.com/jbwashington/authgate.git", branch: "main"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
    zsh_completion.install "completions/_authgate" => "_authgate"
  end

  test do
    assert_match "stripe", shell_output("#{bin}/authgate services")
    assert_match "vercel", shell_output("#{bin}/authgate services")
  end
end
