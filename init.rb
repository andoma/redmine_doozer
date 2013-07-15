# -*- coding: utf-8 -*-

require 'doozer_hook_listener'

Redmine::Plugin.register :doozer do
  name 'Doozer plugin'
  author 'Andreas Öman'
  description 'Integration of doozer autobuild system with redmine'
  version '0.0.1'
  url 'https://github.com/andoma/doozer2'
  author_url 'http://www.lonelycoder.com/'

  project_module :doozer do
    permission :view_builds, :builds => [:index, :build]
    permission :view_downloads, :downloads => :index
  end
  
  menu(:project_menu, :builds, {
         :controller => 'builds',
         :action => 'index' },
       :caption => 'Builds',
       :after => :files,
       :param => :project_id)

  menu(:project_menu, :downloads, {
         :controller => 'downloads',
         :action => 'index' },
       :caption => 'Downloads',
       :after => :overview,
       :param => :project_id)

  settings :partial => 'settings/doozer_settings'

end
