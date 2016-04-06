Pod::Spec.new do |s|
  s.name            = 'couchbase-lite-ios'
  s.version         = '1.3.0'
  s.license         = { :type => 'Apache License, Version 2.0', :file => 'LICENSE.txt' }
  s.homepage        = 'http://mobile.couchbase.com'
  s.summary         = 'An embedded syncable NoSQL database for iOS apps.'
  s.author          = 'Couchbase'
  s.source          = { :http => '<RELEASE ZIP FILE URL>' }
  s.preserve_paths  = 'LICENSE.txt'
  s.ios.deployment_target = '7.0'
  s.frameworks      = 'CFNetwork', 'Security', 'SystemConfiguration'
  s.libraries       = 'z'
  s.xcconfig        = { 'OTHER_LDFLAGS' => '-ObjC' }
  s.default_subspec = 'SQLite'

  s.subspec 'SQLite' do |ss|
    ss.libraries = 'sqlite3'
    ss.preserve_paths = 'CouchbaseLite.framework'
    ss.vendored_frameworks = 'CouchbaseLite.framework'
  end

  s.subspec 'SQLCipher' do |ss|
    ss.vendored_library = 'Extras/libsqlcipher.a'
    ss.preserve_paths = 'CouchbaseLite.framework'
    ss.vendored_frameworks = 'CouchbaseLite.framework'
  end

  s.subspec 'ForestDB' do |ss|
    ss.libraries = 'sqlite3', 'c++'
    ss.vendored_library = 'Extras/libCBLForestDBStorage.a'
    ss.preserve_paths = 'CouchbaseLite.framework'
    ss.vendored_frameworks = 'CouchbaseLite.framework'
  end

  s.subspec 'Listener' do |ss|
    ss.preserve_paths = 'CouchbaseLiteListener.framework'
    ss.vendored_frameworks = 'CouchbaseLiteListener.framework'
  end
end
