window.<%= app_name %> = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    alert('Hello from Backbone!');
  }
};

$(document).ready(function(){
  <%= app_name %>.initialize();
});
