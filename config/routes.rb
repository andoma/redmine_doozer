# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get 'builds/:project_id', :to => 'builds#index'
get 'builds/:project_id/build/:id', :to => 'builds#build'
# post 'post/:id/vote', :to => 'polls#vote'
get 'downloads/:project_id', :to => 'downloads#index'
