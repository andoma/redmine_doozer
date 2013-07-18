
class Release < ActiveResource::Base
  self.site = Setting.plugin_redmine_doozer['server_default'] + '/projects/:project/'
end
