Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :students
      resources :authentication, only: [:create] do
        member do
          delete 'logout'
        end
      end
      #delete 'logout', to: 'authentication#logout'
    end
  end
end
