class KushoCli < Formula
  desc "Kusho CLI - a bash script packaged for Homebrew"
  homepage "https://github.com/kusho-co/kusho-cli-brew"
  url "https://github.com/kusho-co/kusho-cli-brew/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "dec6d4bd031c8b387731bb89f8ad4f245f8ffad247372b977d8cfa94a51478a9"
  version "1.0.0"


  def install
    chmod "+x", "kusho-cli.sh"
    bin.install "kusho-cli.sh" => "kusho-cli"
    chmod "+x", "#{bin}/kusho-cli"
  end

  test do
    # Create a temporary directory for testing
    test_config_dir = testpath/".config/kusho"
    ENV["HOME"] = testpath.to_s  # Redirect $HOME to testpath

    # Run the script once to generate a UUID
    system "#{bin}/kusho-cli"
  end
end
