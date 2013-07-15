
class DoozerHookListener < Redmine::Hook::ViewListener
  def view_issues_changeset_bottom(context = {})

#    id = context[:changeset].project.identifier
#    rev = context[:changeset].revision

#    begin
#      dr = DecoratedRevision.find(rev, :params => {
#                                    :project => id
#                                  })

      context[:controller].send(:render_to_string, {
                                  :partial => "test",
                                  :locals => context
                                })


#      return content_tag("p", "Version " + dr.version);
#    rescue
#      return ""
#    end
  end
end
