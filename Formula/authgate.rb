class Authgate < Formula
  include Language::Python::Virtualenv

  desc "Switch user-level CLI auth between named profiles (cf, stripe, vercel, gh, doctl, supabase, claude, codex, aws)"
  homepage "https://github.com/jbwashington/authgate"
  url "https://github.com/jbwashington/authgate/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "072f96c2388a27ade713f8cd7f0c79ade1df0e36c0684769e5d3bccc84268c2c"
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
    assert_match "supabase", shell_output("#{bin}/authgate services")
  end
end
