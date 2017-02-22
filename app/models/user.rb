class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :omniauthable,
         :validatable #,:recoverable,:confirmable
  include DeviseTokenAuth::Concerns::User
  has_many :tickets
  has_many :comments
  enum role: [:customer , :agent , :admin]

  def name
    nickname || email
  end

  rails_admin do
    list do
      field :id
      field :name
      field :email
      field :role
      field :last_sign_in_at
      field :last_sign_in_ip
      field :sign_in_count
    end
    edit do
      field :nickname
      field :email
      field :role
      field :password
      field :password_confirmation
    end
  end
end