require 'spec_helper' 

describe User do

  context 'test user can? method' do

    before(:each) do
      @user = FactoryGirl.create(:admin_user)
      @role = FactoryGirl.create(:admin_role)
      @show_authority   = FactoryGirl.create(:show_authority)
      @create_authority = FactoryGirl.create(:create_authority)
      @edit_authority   = FactoryGirl.create(:edit_authority)
      @delete_authority = FactoryGirl.create(:delete_authority)
    end

    it "test show_post authority" do
      @role.authorities << @show_authority
      @role.authority = @show_authority.value
      @user.roles << @role
      @user.can?("show_post").should == true
    end

    it "test create_post authority" do
      @role.authorities << @create_authority
      @role.authority = @create_authority.value
      @user.roles << @role
      @user.can?("create_post").should == true
    end

    it "test edit_post authority" do
      @role.authorities << @edit_authority
      @role.authority = @edit_authority.value
      @user.roles << @role
      @user.can?("edit_post").should == true
    end

    it "test delete_post authority" do
      @role.authorities << @delete_authority
      @role.authority = @delete_authority.value
      @user.roles << @role
      @user.can?("delete_post").should == true
    end

    it "test all authority" do
      @role.authorities << [@delete_authority, @show_authority, @edit_authority, @create_authority]
      @role.authority = @delete_authority.value + @show_authority.value + @edit_authority.value + @create_authority.value
      @user.roles << @role
      @user.can?("delete_post").should == true
      @user.can?("edit_post").should   == true
      @user.can?("create_post").should == true
      @user.can?("show_post").should   == true
    end

  end

end
