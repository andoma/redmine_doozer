class DownloadsController < ApplicationController
  unloadable

  before_filter :find_project, :authorize

  def find_project
    @project = Project.find(params[:project_id])
  end



  def track
    @releases = Release.find(:all, :params => { :project => @project.identifier })

    @tracks = @releases.map {|t| { :title => t.title, :id => t.id, :active => t.id == params[:track] }}.compact
    tracklist = @releases.select { |t| t.id == params[:track] }

    if tracklist.length == 0
      render_404
      return
    end
    @track = tracklist[0]
  end

  def index
    @releases = Release.find(:all, :params => { :project => @project.identifier })
    if @releases.length == 0
      render_404
      return
    end

    @track = @releases[0]

    @tracks = @releases.map {|t| { :title => t.title, :id => t.id, :active => t.id == @track.id }}.compact
    render :action => 'track'
  end

end
