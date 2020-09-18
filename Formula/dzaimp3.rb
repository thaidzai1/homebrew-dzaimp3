class Dzaimp3 < Formula
  desc "A simple tools for people love music and terminal."
  homepage "https://github.com/thaidzai285/dzai-mp3-crawler-service"
  url "https://github.com/thaidzai285/dzai-mp3-crawler-service/archive/v0.1-b.tar.gz"
  sha256 "fa663ffd786dc06d5e1e70d16ccad9b910b95d6330af86560a5fa93c85eef774"

  depends_on "go"

  def install
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "on"
    ENV["GOFLAGS"] = "-mod=vendor"
    ENV["PATH"] = "#{ENV["PATH"]}:#{buildpath}/bin"
    (buildpath/"src/github.com/thaidzai285/dzai-mp3-crawler-service").install buildpath.children
    cd "src/github.com/thaidzai285/dzai-mp3-crawler-service" do
      system "go", "install", "-o", bin/"dzaimp3_download", "./cmd/dzai_download"
    end
  end

  test do
    assert_match /Simple port-forward wrapper tool for multiple pods/, shell_output("#{bin}/dzaimp3 -h", 0)
  end
end