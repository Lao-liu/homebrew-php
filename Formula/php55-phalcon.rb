require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php55Phalcon < AbstractPhp55Extension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalconphp.com/"
  url "https://github.com/phalcon/cphalcon/archive/v3.3.0.tar.gz"
  sha256 "131a09f24555ba97405e00638aef8bb6f7ac73ec64d1bf2c30c519738c8f3dac"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "6661c8492397f326fd73be8ef1878aa69f88e92dab1bf26350809df3c100e98b" => :sierra
    sha256 "d89de46122be4976293cc993ee23a99f6366643d57629bd30d29cc5064d1ae22" => :el_capitan
    sha256 "b7c3ec553a03b50a9150d45b940ba83d925449fb6c111536fd1b2d34238d7c52" => :yosemite
  end

  depends_on "pcre"

  def install
    Dir.chdir "build/php5/64bits"

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig,
                          "--enable-phalcon"
    system "make"
    prefix.install "modules/phalcon.so"
    write_config_file if build.with? "config-file"
  end
end
