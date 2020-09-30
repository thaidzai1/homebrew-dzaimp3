class Dzaimp3 < Formula
  desc "A simple tools for people love music and terminal."
  homepage "https://github.com/thaidzai285/dzai-mp3-crawler-service"
  url "https://github.com/thaidzai285/dzai-mp3-crawler-service/archive/v0.2-b.tar.gz"
  sha256 "636647e855187d409853d5546f29298e0993b7dcbaea811fcae9d67d0ee68d30"

  depends_on "go"

  def install
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "on"
    ENV["GOFLAGS"] = "-mod=mod"
    ENV["PATH"] = "#{ENV["PATH"]}:#{buildpath}/bin"
    (buildpath/"src/github.com/thaidzai285/dzai-mp3-crawler-service").install buildpath.children
    cd "src/github.com/thaidzai285/dzai-mp3-crawler-service" do
      system "go", "build", "-o", bin/"dzaimp3_download", "./cmd/dzai_download"
    end
  end

  test do
    assert_match /Simple dzaimp3/, shell_output("#{bin}/dzaimp3 -h", 0)
  end
end