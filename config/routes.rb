Rails.application.routes.draw do
  root to: proc { [403, {}, ['Forbidden']] }

  mount Api => '/api'
end
