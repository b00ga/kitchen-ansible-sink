#!/bin/sh

if ! command -v ansible; then
   pkg install -v illumos-tools developer/gcc51 developer/gcc51/libgmp-gcc51
   export PATH=/opt/gcc-5.1.0/bin:$PATH
   wget sourceware.org:/pub/libffi/libffi-3.2.1.tar.gz
   tar xvfz libffi-3.2.1.tar.gz
   cd libffi-3.2.1
   CFLAGS="-m64" ./configure --build=amd64-pc-solaris
   make
   make install
   cd ..
   wget https://bootstrap.pypa.io/get-pip.py
   python get-pip.py
   CFLAGS="-m64 -I/usr/local/lib/libffi-3.2.1/include" LDFLAGS="-L/usr/local/lib -L/opt/gcc-5.1/lib/64"  pip install --no-binary :all: ansible

   patch /usr/lib/python2.6/site-packages/ansible/module_utils/facts.py << EOF
--- module_utils/facts.py.orig  2017-01-30 00:25:10.486559767 +0000
+++ module_utils/facts.py       2017-01-30 00:23:20.149210377 +0000
@@ -311,6 +311,8 @@
     def get_pkg_mgr_facts(self):
         if self.facts['system'] == 'OpenBSD':
                 self.facts['pkg_mgr'] = 'openbsd_pkg'
+        elif self.facts['system'] == 'SunOS':
+                self.facts['pkg_mgr'] = 'pkg5'
         else:
             self.facts['pkg_mgr'] = 'unknown'
             for pkg in Facts.PKG_MGRS:
EOF
fi
