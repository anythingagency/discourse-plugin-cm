require 'rails_helper'

describe DiscoursePluginCm::ActionsController do
  before do
    SiteSetting.queue_jobs = false
  end

  it 'can list' do
    sign_in(Fabricate(:user))
    get "/discourse-plugin-cm/list.json"
    expect(response.status).to eq(200)
  end
end
