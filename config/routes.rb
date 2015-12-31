Rails.application.routes.draw do
get "clients" => "clients#index"
get "clients/create" => "clients#create"
get "clients/destroy" => "clients#destroy"
get "clients/:id" => "clients#show" 
get "sessions/new" => "sessions#new"
get "prospects/show" => "prospects#show"

post "sessions" => "sessions#login"
post "prospects/create" => "prospects#create"

delete "sessions" => "sessions#destroy"
delete "prospects/:id" => "prospects#destroy"
patch "prospects" => "prospects#update"


root to: "clients#index"
end
