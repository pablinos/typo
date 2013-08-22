require 'spec_helper'

describe "admin/content/edit.html.erb as admin" do
  before do
    admin = stub_model(User, :settings => {:editor => 'simple'}, :admin? => true,
                       :text_filter_name => "", :profile_label => "admin")
    blog = Factory(:blog, :base_url => "http://myblog.net/")
    article = Factory(:article)
    text_filter = stub_model(TextFilter)

    view.stub(:link_to_destroy_with_profiles)
    article.stub(:text_filter) { text_filter }
    view.stub(:current_user) { admin }
    view.stub(:this_blog) { blog }
    
    # FIXME: Nasty. Controller should pass in @categories and @textfilters.
    Category.stub(:all) { [] }
    TextFilter.stub(:all) { [text_filter] }

    assign :article, article
    assign(:images, [])
    assign(:macros, [])
    assign(:resources, [])
  end

  it "renders the merge_with partial" do
    render :template => "admin/content/new"
    view.should render_template(:partial => "admin/content/_merge_form")
  end
end
