Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'welcome#home'
get 'about_us', to: 'welcome#about_us'
get 'speak_to_us', to: 'welcome#speak_to_us'

get 'ec_journalists', to: 'services#ec_journalists'
get 'linkedin', to: 'services#linkedin'
get 'instagram', to: 'services#instagram'
get 'youtube', to: 'services#youtube'

get 'admin_profile', to: 'admin#admin_profile'
get 'client_base', to: 'admin#client_base'
get 'edit_client', to: 'admin#edit_client'
get 'new_client', to: 'admin#new_client'

get 'client_profile', to: 'client#client_profile'


end
