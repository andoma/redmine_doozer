# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get 'builds/:project_id', :to => 'builds#index'
get 'builds/:project_id/build/:id', :to => 'builds#build'

get 'downloads/:project_id', :to => 'downloads#index'

get 'downloads/:project_id/:track', :to => 'downloads#track'
