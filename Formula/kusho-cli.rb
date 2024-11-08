class KushoCli < Formula
  desc "Kusho CLI - a bash script packaged for Homebrew"
  homepage "https://github.com/kusho-co/kusho-cli-brew"
  url "https://github.com/kusho-co/kusho-cli-brew/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "312e5d6a552eb561cc3306beb7546fd1e52bad5011a06ad35c9a2f08b700c299"
  version "1.0.0"

  def install
    # Instead of installing directly to bin, we'll create a libexec directory
    # This is a common pattern in Homebrew for scripts
    libexec.install "kusho-cli.sh" => "kusho-cli"
    
    # Make the libexec script executable
    chmod 0755, libexec/"kusho-cli"
    
    # Create a small shell script in bin that calls the actual script
    (bin/"kusho-cli").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/kusho-cli" "$@"
    EOS
    
    # Make the wrapper script executable
    chmod 0755, bin/"kusho-cli"
  end

  test do
    test_config_dir = testpath/".config/kusho"
    ENV["HOME"] = testpath.to_s
    
    # Verify executable permissions
    assert_predicate bin/"kusho-cli", :executable?, "kusho-cli is not executable!"
    assert_predicate libexec/"kusho-cli", :executable?, "Main script is not executable!"
    
    # Run the script
    system "#{bin}/kusho-cli"
  end
end