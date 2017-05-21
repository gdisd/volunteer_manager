module FeatureSupport

  def sign_up(email, password)
    visit '/'
    click_link 'Sign Up'
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password
    click_button 'Sign up'
  end

  def sign_out
    click_link 'Sign Out'
  end
end
