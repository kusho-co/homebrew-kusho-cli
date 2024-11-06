class KushoCli < Formula
  desc "Kusho CLI - a bash script packaged for Homebrew"
  homepage "https://github.com/kusho-co/kusho-cli-brew"
  url "https://github.com/YOUR-GITHUB-USERNAME/REPO-NAME/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "<SHA256-checksum-of-the-tar-file>"
  version "1.0.0"

  depends_on "uuidgen" # Ensures uuidgen is available

  def install
    bin.install "kusho-cli"  # Ensure your script is named 'kusho-cli' in the repo
  end

  test do
    # Create a temporary directory for testing
    test_config_dir = testpath/".config/kusho"
    ENV["HOME"] = testpath.to_s  # Redirect $HOME to testpath

    # Run the script once to generate a UUID
    system "#{bin}/kusho-cli"
  end
end
