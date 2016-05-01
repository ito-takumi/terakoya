# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string           default(""), not null
#  urlsafe_name           :string           default(""), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  lock_version           :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    context 'given a valid_user' do
      let(:valid_user) { build(:user) }

      it 'is valid' do
        expect(valid_user.valid?).to be true
      end

      it 'can save' do
        count_prev = User.count
        expect(valid_user.save).to eq true
        expect(User.count - count_prev).to eq +1
      end

      it "has no error messages" do
        valid_user.valid?
        expect(valid_user.errors.size).to eq 0
        expect(valid_user.errors.full_messages.size).to eq 0
      end
    end # context 'given a valid_user' do

    context 'given a user with invalid email' do
      let(:invalid_user) { build(:user, email: email) }

      context 'given a blank email' do
        let(:email) { nil }

        it 'is invalid' do
          expect(invalid_user.invalid?).to be true
        end

        it 'cannot save' do
          count_prev = User.count
          expect(invalid_user.save).to eq false
          expect(User.count - count_prev).to eq 0
        end

        it 'has an error message about email' do
          invalid_user.valid?
          expect(invalid_user.errors.size).to eq 1
          expect(invalid_user.errors.full_messages.size).to eq 1
        end
      end # context 'given a blank email' do
    end # context 'given a user with invalid email' do
  end # describe "validation" do


  describe ".urlsafe_name" do
    it "returns 'hoge' for 'hoge'" do
      expect(User.urlsafe_name('hoge')).to eq 'hoge'
    end

    it "makes all charactors lowercase" do
      expect(User.urlsafe_name('ABC123stu456XYZ')).to eq 'abc123stu456xyz'
    end

    it "removes '\\' char" do
      expect(User.urlsafe_name('ABC\\123')).to eq 'abc123'
    end
  end
end
