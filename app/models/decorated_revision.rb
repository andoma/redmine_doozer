
class DecoratedRevision < ActiveResource::Base
  self.site = Setting.plugin_redmine_doozer['server_default'] + '/projects/:project/'
  self.element_name = 'revision'
end
