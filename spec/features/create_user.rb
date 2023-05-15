require 'rails_helper'

describe 'creating a user', type: :feature, js: true do

  it 'successfully creates user' do
    visit '/'

    within '#new_user' do
      fill_in 'user_email', with: 'phuongnguyenit25@gmail.com'
      fill_in 'user_encrypted_password', with: '12345678'
    end
   click_button 'Login / Register'

   expect(page).to have_content 'Login successfully'
  end

  context 'when login user faily' do
    let!(:user) {FactoryBot.create :user, email: 'phuongnguyenit25@gmail.com', password: '12345678'}
    it 'failly login user with wrong password' do
      visit '/'

      within '#new_user' do
        fill_in 'user_email', with: 'phuongnguyenit25@gmail.com'
        fill_in 'user_encrypted_password', with: '123'
      end
      click_button 'Login / Register'

      expect(page).to have_content 'Email or Password are wrong'
    end

    it 'failly login user with wrong email format' do
      visit '/'

      within '#new_user' do
        fill_in 'user_email', with: 'phuongnguyenit25@gmail.com'
        fill_in 'user_encrypted_password', with: '123'
      end
      click_button 'Login / Register'

      expect(page).to have_content 'Email is invalid'
    end
  end

  context 'when logout successfully' do
    it 'logout successfully' do
      user = FactoryBot.create :user, email: 'test@gmail.com', password: '12345678'
      login_as(user)

      visit '/'

      click_link 'Log out'

      expect(page).to have_content 'Logout successfully'
    end
  end
end
