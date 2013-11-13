require 'formula'

class Petsc < Formula
  homepage 'http://www.mcs.anl.gov/petsc/index.html'
  url 'http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-3.4.3.tar.gz'
  sha1 '7458f01c003dc7381d694445b5a2ecdbca91aa57'

  depends_on :mpi => :cc
  depends_on :fortran
  depends_on :x11
  depends_on 'cmake' => :build

  def install
    ENV.deparallelize
    system "./configure", "--with-debugging=0", "--prefix=#{prefix}"
    system "make all"
    system "make test"
    system "make install"
  end
end
