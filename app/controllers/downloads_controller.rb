class DownloadsController < ApplicationController
  unloadable

#  before_filter :find_project, :authorize, :only => :index
  before_filter :find_project, :authorize

 def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:project_id])
  end

  def index
    begin
      id = @project.identifier
      @releases = Release.find(:all,
                               :params => {
                                 :project => id,
                               })
    rescue
      flash[:error] = 'Buildsystem is currently offline, please come back later'
    end
  end
end
