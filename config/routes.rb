Rails.application.routes.draw do

  resources :leave_applications

  resources :courses do

    resources :course_pre_requisites, only: [:create, :destroy]
    collection do
      get 'department_wise', :as => 'department_wise'
      post 'department_wise'

      get 'degree_wise', :as => 'degree_wise'
      post 'degree_wise'
    end
  end

  resources :faculties do
    resources :achievements, only: [:create, :destroy]
    resources :experiences, only: [:create, :destroy]
    resources :qualifications, only: [:create, :destroy]
    resources :interest_areas, only: [:create, :destroy]

    collection do
      get 'department_wise', :as => 'department_wise'
      post 'department_wise'
    end
  end


  resources :academic_degrees do
    collection do
      get 'programme_wise', :as => 'programme_wise'
      post 'programme_wise'
    end

    member do
      get 'add_department', :as => 'add_department'
      post 'add_department'

      get 'del_department', :as => 'del_department'
      post 'del_department'
    end
  end

  resources :departments do
    member do
      get 'add_academic_degree', :as => 'add_academic_degree'
      post 'add_academic_degree'

      get 'del_academic_degree', :as => 'del_academic_degree'
      post 'del_academic_degree'
    end
  end
  resources :publications
  resources :projects

  resources :sessions, only: [:new, :create, :destroy]

  get "/login" => "sessions#new", as: "login"
  delete "/logout" => "sessions#destroy", as: "logout"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
