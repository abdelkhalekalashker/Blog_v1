class User < ApplicationRecord
    has_secure_password

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :username, presence:true, uniqueness: true, length: {minimum:3,maximum:29}
    validates :email , presence:true, uniqueness: true, length: {minimum:7,maximum:40},format: {with: VALID_EMAIL_REGEX }

    has_many :articles
end
