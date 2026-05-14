class Authgate < Formula
  include Language::Python::Virtualenv

  desc "Switch user-level CLI auth between named profiles (cloudflare, stripe, vercel, gh, doctl)"
  homepage "https://github.com/jbwashington/authgate"
  url "https://github.com/jbwashington/authgate/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "4d58b6fcffa1534526704d0e5cbf6cbed6fde49c45b91782a5c8ae122e462fb9"
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
