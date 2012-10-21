window.<%= app_name %> =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> alert 'Hello from Backbone!'

$(document).ready ->
  <%= app_name %>.initialize()
