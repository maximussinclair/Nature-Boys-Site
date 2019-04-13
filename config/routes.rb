Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'welcome#home'
get 'about_us', to: 'welcome#about_us'
get 'speak_to_us', to: 'welcome#speak_to_us'

get 'ec_journalists', to: 'services#ec_journalists'
get 'linkedin', to: 'services#linkedin'
get 'instagram', to: 'services#instagram'
get 'youtube', to: 'services#youtube'

end
