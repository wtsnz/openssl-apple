Pod::Spec.new do |s|
    openssl_version   = "1.1.1g"
    # Might need updating next week 👀
    openssl_targets   = "macos64-x86_64"
    # openssl_targets   = "ios-sim-cross-x86_64 ios64-cross-arm64 macos64-x86_64"
    script_version    = "6"

    s.name            = "OpenSSL-Apple"
    s.version         = "#{openssl_version}.#{script_version}"
    s.summary         = "A script for compiling OpenSSL for Apple Devices"
    s.authors         = "Felix Schulze", "Davide De Rosa", "Ezat Hashim"

    s.homepage        = "https://github.com/keeshux/openssl-apple.git"
    s.source          = { :git => s.homepage.to_s, :tag => "v#{script_version}" }
    s.license         = { :type => 'Apache', :file => 'LICENSE' }

    s.prepare_command = <<-CMD
./build-libssl.sh --version="#{openssl_version}" --targets="#{openssl_targets}" --min-macos-sdk="10.13"
./create-openssl-framework.sh dynamic
    CMD

    s.ios.deployment_target         = "11.0"
    s.ios.vendored_frameworks       = "frameworks/iPhone/openssl.framework"
    s.osx.deployment_target         = "10.11"
    s.osx.vendored_frameworks       = "frameworks/MacOSX/openssl.framework"
    s.requires_arc                  = false
end
