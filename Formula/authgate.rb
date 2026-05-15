class Authgate < Formula
  include Language::Python::Virtualenv

  desc "Switch user-level CLI auth between named profiles (cf, stripe, vercel, gh, doctl, supabase)"
  homepage "https://github.com/jbwashington/authgate"
  url "https://github.com/jbwashington/authgate/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "e2abefe513877ac6ce71b9e5b64770f293b1b3a559e0b18ffd1fbfd330d3eac7"
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
