Pages::Application.routes.draw do
  root to: "home#home"

  namespace :api do
    resources :pages do
      member do
        post 'publish'
        get 'total_words'
      end
      collection do
        get 'published'
        get 'unpublished'
      end
    end
  end
end
