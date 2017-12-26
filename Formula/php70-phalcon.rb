require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php70Phalcon < AbstractPhp70Extension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalconphp.com/"
  url "https://github.com/phalcon/cphalcon/archive/v3.3.0.tar.gz"
  sha256 "131a09f24555ba97405e00638aef8bb6f7ac73ec64d1bf2c30c519738c8f3dac"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "cabcda67f566d2499094ee2bd780ca8165acdfbe99109923988da60483e4611f" => :high_sierra
    sha256 "88bc77d9c3a9967632fb4c7732cb04be1709becdfa1f08f5bf5e091d5f46ead5" => :sierra
    sha256 "3ce3ae717c7b4b62f1e734da2b71f8bbaccca02e607b8949c6f66718c1a0120b" => :el_capitan
  end

  depends_on "pcre"

  def install
    Dir.chdir "build/php7/64bits"

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig,
                          "--enable-phalcon"
    system "make"
    prefix.install "modules/phalcon.so"
    write_config_file if build.with? "config-file"
  end
end
