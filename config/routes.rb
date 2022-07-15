Rails.application.routes.draw do
  root to: "home#index"

  namespace :owners do
    get 'dashboard/index'
  end
  namespace :players do
    get 'dashboard/index'
  end
  namespace :users do
    get 'dashboard/index'
  end

  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_for :owners, path: 'owners', controllers: {
    sessions: 'owners/sessions',
    registrations: 'owners/registrations'
  }

  devise_for :players, path: 'players', controllers: {
    sessions: 'players/sessions',
    registrations: 'players/registrations'
  }

  devise_scope :user do
    authenticated :user do
      namespace :users do
        get 'dashboard/index', as: :authenticated_root
      end
    end
  end

  devise_scope :player do
    authenticated :player do
      namespace :players do
        get 'dashboard/index', as: :authenticated_root
      end
    end
  end

  devise_scope :owner do
    authenticated :owner do
      namespace :owners do
        get 'dashboard/index', as: :authenticated_root
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
