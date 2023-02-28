# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digets :string           not null
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email     (email) UNIQUE
#  index_users_on_username  (username) UNIQUE
#
class User < ApplicationRecord
  has_secure_password

  validated :email, presence: true, uniqueness: true
  validated :username, presence: true, uniqueness: true
  validated :password_digets, length: { minimum: 6 }
end
