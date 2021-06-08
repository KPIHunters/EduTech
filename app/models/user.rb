class User < ApplicationRecord
  devise :two_factor_authenticatable,
         :otp_secret_encryption_key => ENV['_2fa']

  # Dependencies
  acts_as_paranoid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :confirmable, :lockable,
         :two_factor_authenticatable, :two_factor_backupable,
         otp_secret_encryption_key: NENV['SECRET_KEY_BASE']

  # Relations
  has_one :profile, dependent: :destroy
  has_many :admin_courses, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :courses, through: :subscriptions, dependent: :destroy

  # Validations
  validates :full_name, length: { minimum: 5, maximum: 70 }, presence: true
  validates :email, format: { with: /^(.+)@(.+)$/, multiline: true, message: "Email invalid" },
                    length: { minimum: 4, maximum: 254 },
                    presence: true

  # Callbacks
  after_validation :add_defaults

  # Extra Attrs
  attr_accessor :_2fa

  # Callbacks
  after_destroy :send_destroy_email

  def short_name
    split_name = self.full_name.split(' ')
    "#{split_name[0]} #{split_name[-1]}"
  end

  def username
    self.short_name.downcase.gsub(' ', '.')
  end

  private
  def add_defaults
    if self.errors.empty?
      Subscription.create user_id: self.id, course_id: 1
    end
  end

  def send_destroy_email
    UsersMailer.with(user: self).destroy_email.deliver_now
  end
end
