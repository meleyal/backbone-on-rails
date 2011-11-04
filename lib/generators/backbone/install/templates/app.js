window.<%= app_name %> = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  init: function() {
    alert('Hello from Backbone!');
  }
};

$(document).ready(function(){
  <%= app_name %>.init();
});