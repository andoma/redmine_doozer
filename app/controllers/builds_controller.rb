include RepositoriesHelper

class BuildsController < ApplicationController
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
      @builds_count = Build.count({:project => id})
      @builds_pages = Paginator.new(self, @builds_count,
                                    per_page_option, params["page"])
      @builds = Build.find(:all,
                           :params => {
                             :project => id,
                             :limit   => @builds_pages.items_per_page,
                             :offset  => @builds_pages.current.offset
                           })
    rescue
      flash[:error] = 'Buildsystem is currently offline, please come back later'
    end
  end

  def build
    begin
      id = @project.identifier
      @build = Build.find(params[:id],
                          :params => {
                            :project => id
                          })

    rescue
      flash[:error] = 'Buildsystem is currently offline, please come back later'
    end
  end
end
