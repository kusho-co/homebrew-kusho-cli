class KushoCli < Formula
  desc "Kusho CLI - a bash script packaged for Homebrew"
  homepage "https://github.com/kusho-co/kusho-cli-brew"
  url "https://github.com/kusho-co/kusho-cli-brew/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "78d1dc384913f0b3bafc13a8895284e1380832bf70c6346c0bfabf7f2f0aece8"
  version "1.0.0"


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
