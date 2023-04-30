class User < ApplicationRecord

  # ユーザーをデータベースに保存する前にemail属性を強制的に小文字に変換
  before_save {self.email = email.downcase}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,  presence: true,
                    length: {maximum: 50}

  validates :email, presence: true,
                    length: {maximum: 240},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: true
                    

  validates :password, presence: true, length: {minimum: 6}
  
  has_secure_password
  
end
