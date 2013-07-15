
class Build < ActiveResource::Base
  self.site = Setting.plugin_doozer['server_default'] + '/projects/:project/'

  def self.count(params)
    path = "#{prefix(params)}#{collection_name}.count#{query_string(params)}"
    connection.get(path, headers).body.to_i || 0
  end

end
