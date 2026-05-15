class Authgate < Formula
  include Language::Python::Virtualenv

  desc "Switch user-level CLI auth between named profiles (cf, stripe, vercel, gh, doctl, supabase, claude, codex)"
  homepage "https://github.com/jbwashington/authgate"
  url "https://github.com/jbwashington/authgate/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "b0eb8af2908d85a327b4745c80232e3672082f2933eda51581fae06ae24d7376"
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
