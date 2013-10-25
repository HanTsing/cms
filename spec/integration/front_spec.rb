require'spec_helper' 

describe 'front page' do
  
  context 'member visit front page' do
    it 'visit member posts' do
      admin = FactoryGirl.create(:admin_user)
      member_post  = FactoryGirl.create(:member_post)
      visit root_path
      click_link 'login'
      fill_in 'user_email', with: admin.email
      fill_in 'user_password', with: admin.password
      click_button 'Sign in'
      expect(page).to have_content 'welcome'
      expect(page).to have_content member_post.title
    end
  end

  context 'non-member visit front page' do
    it 'visit non-member posts' do
      non_member_post  = FactoryGirl.create(:non_member_post)
      visit root_path
      expect(page).not_to have_content 'welcome'
      expect(page).to have_content non_member_post.title
    end
  end

end
