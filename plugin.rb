# name: DiscoursePluginCm
# about:
# version: 0.1
# authors: 
# url: https://github.com/


register_asset "stylesheets/common/discourse-plugin-cm.scss"


enabled_site_setting :discourse_plugin_cm_enabled

PLUGIN_NAME ||= "DiscoursePluginCm".freeze

after_initialize do
  
  # see lib/plugin/instance.rb for the methods available in this context
  

  module ::DiscoursePluginCm
    class Engine < ::Rails::Engine
      engine_name PLUGIN_NAME
      isolate_namespace DiscoursePluginCm
    end
  end

  

  
  require_dependency "application_controller"
  class DiscoursePluginCm::ActionsController < ::ApplicationController
    requires_plugin PLUGIN_NAME

    before_action :ensure_logged_in

    def list
      render json: success_json
    end
  end

  DiscoursePluginCm::Engine.routes.draw do
    get "/list" => "actions#list"
  end

  Discourse::Application.routes.append do
    mount ::DiscoursePluginCm::Engine, at: "/discourse-plugin-cm"
  end
  
end
