# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'fetch-avassets'

  app.info_plist['UIMainStoryboardFile'] = 'Storyboard'

  app.frameworks += ['AVFoundation','AssetsLibrary']
end
