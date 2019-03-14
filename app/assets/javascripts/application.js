//= require rails-ujs
//= require_tree .

request.env["exception_notifier.exception_data"] = {
      :current_user => User.first
    }
