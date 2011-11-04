window.<%= app_name %> =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> alert 'Hello from Backbone!'

$(document).ready ->
  <%= app_name %>.init()
