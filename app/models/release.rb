
class Release < ActiveResource::Base
  self.site = Setting.plugin_doozer['server_default'] + '/projects/:project/'
end
