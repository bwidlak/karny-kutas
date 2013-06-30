KarnyKutas::Application.routes.draw do

	resources :messages, only: [:index, :show, :new, :create, :search] do
		collection do
			get 'search'
		end
	end

	# The priority is based upon order of creation: first created -> highest priority.
	# See how all your routes lay out with "rake routes".

	# You can have the root of your site routed with "root"
	root 'messages#new'
end
