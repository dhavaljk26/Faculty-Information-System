Rails.application.routes.draw do

  root 'homes#index'
  get "/approve_leaves" => "homes#approve_leaves"
  post "/approve_leaves" => "homes#approve_leaves"

  resources :courses do

    resources :course_pre_requisites, only: [:create, :destroy]

    collection do
      get 'department_wise', :as => 'department_wise'
      post 'department_wise'

      get 'degree_wise', :as => 'degree_wise'
      post 'degree_wise'
    end

    member do
      get 'add_faculty', :as => 'add_faculty'
      post 'add_faculty'

      get 'del_faculty', :as => 'del_faculty'
      post 'del_faculty'
    end

  end

  resources :faculties do
    resources :achievements, only: [:create, :destroy]
    resources :experiences, only: [:create, :destroy]
    resources :qualifications, only: [:create, :destroy]
    resources :interest_areas, only: [:create, :destroy]
    resources :leave_applications, only: [:create, :destroy]

    collection do
      get 'department_wise', :as => 'department_wise'
      post 'department_wise'
    end

    member do
      get 'see_projects', :as => 'see_projects'
      post 'see_projects'

      get 'add_project', :as => 'add_project'
      post 'add_project'

      get 'del_project', :as => 'del_project'
      post 'del_project'


      get 'see_publications', :as => 'see_publications'
      post 'see_publications'

      get 'add_publication', :as => 'add_publication'
      post 'add_publication'

      get 'del_publication', :as => 'del_publication'
      post 'del_publication'


      get 'see_courses', :as => 'see_courses'
      post 'see_courses'

      get 'add_course', :as => 'add_course'
      post 'add_course'

      get 'del_course', :as => 'del_course'
      post 'del_course'

      get 'see_leave_applications', :as => 'see_leave_applications'
      post 'see_leave_applications'

      get 'add_leave_application', :as => 'add_leave_application'
      post 'add_leave_application'

      get 'del_leave_applications', :as => 'del_leave_applications'
      post 'del_leave_applications'
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

  resources :publications do
    member do
      get 'add_faculty', :as => 'add_faculty'
      post 'add_faculty'

      get 'del_faculty', :as => 'del_faculty'
      post 'del_faculty'
    end
  end

  resources :projects do
    member do
      get 'add_faculty', :as => 'add_faculty'
      post 'add_faculty'

      get 'del_faculty', :as => 'del_faculty'
      post 'del_faculty'
    end
  end

  resources :sessions, only: [:new, :create, :destroy]

  get "/login" => "sessions#new", as: "login"
  delete "/logout" => "sessions#destroy", as: "logout"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
