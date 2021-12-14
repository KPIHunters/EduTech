class Profile < ApplicationRecord
  # Dependencies
  acts_as_paranoid
  include SocialData

  # Relations Dependencies
  belongs_to :user, dependent: :destroy

  # Relations
  has_many :experiences
  has_many :social_sessions, through: :user

  # Validations Callbacks
  # before_validation :check_editable, if: -> { validated_docs } TODO
  before_validation :validate_phone
  before_validation :validate_ibge
  # Validations
  validate :gov_id_validity
  validate :ibge_code_validity
  validates :state_ibge, length: { is: 2 }, presence: true
  validates :county_ibge, length: { is: 7 }, presence: true
  validates :full_address, length:  { minimum: 15, maximum: 140 }, presence: true
  validates :zip_code, length: { minimum: 8, maximum: 20 }, presence: true
  validates :phone, length: { minimum: 11, maximum: 20 }, presence: true
  validates :facebook_link, format: { with: /facebook.com/, message: "Não é um link do facebook" }, presence: false, if: -> { !facebook_link.nil? && facebook_link.length > 0 }
  validates :linkedin_link, format: { with: /linkedin.com/, message: "Não é um link do linkedin" }, presence: false, if: -> { !linkedin_link.nil? && linkedin_link.length > 0 }
  validates :twitter_link, format: { with: /twitter.com/, message: "Não é um link do twitter" }, presence: false, if: -> { !twitter_link.nil? && twitter_link.length > 0 }
  validates :bank_code, length: { minimum: 3, maximum: 10 }, if: -> { !bank_code.nil? && bank_code.length > 0 }
  validates :bank_agency, length: { minimum: 4, maximum: 15 }, if: -> { !bank_agency.nil? && bank_agency.length > 0 }
  validates :bank_account, length: { minimum: 4, maximum: 30 }, if: -> { !bank_account.nil? && bank_account.length > 0 }
  validates :birthday, presence: true
  # validates :company_fantasy_name, length: { minimum: 2, maximum: 60 }, presence: true
  # validates :company_legal_name, length: { minimum: 2, maximum: 70 }, presence: true
  # # validates :website, presence: true

  # validates :customer_description, presence: true, on: :update, if: -> { shopify_token == shopify_token_was and accepted_terms == true }

  # Uploads / Attached
  has_one_attached :photo, dependent: :destroy
  has_one_attached :banner, dependent: :destroy
  has_one_attached :selfie, dependent: :destroy
  has_one_attached :legal_doc, dependent: :destroy
  has_one_attached :signature, dependent: :destroy
  has_one_attached :third_part_receive_equipments, dependent: :destroy
  has_many_attached :bank_orders_receipts, dependent: :destroy

  # Callbacks before destroy
  before_destroy :purge_attached_files

  def truncate_bio
    "#{self.bio[0..50]}..."
  end

  private
  
  def gov_id_validity
    if self.gov_id_pf.nil?
      self.errors.add :gov_id_pf, "#{I18n.t('flash.mandatory')}"
    else
      unless CPF.valid?(self.gov_id_pf, strict: true)
        self.errors.add :gov_id_pf, "#{I18n.t('flash.invalid')}"
      end
    end

    if self.gov_id_pj.nil?
      # self.errors.add :gov_id_pj, "#{I18n.t('flash.invalid')}"
    else
      unless CNPJ.valid?(self.gov_id_pj, strict: true)
        self.errors.add :gov_id_pj, "#{I18n.t('flash.invalid')}"
      end
    end
  end

  def ibge_code_validity
    cis = self.county_ibge.to_s
    sis = self.state_ibge.to_s
    if cis[0..1] != sis
      self.errors.add :county_ibge, I18n.t('flash.verify')
    end
  end

  def validate_phone
    if self.phone[0] == 0
      self.phone = self.phone[1..self.phone.length-1]
    end
    unless self.phone =~ /[0-9]{2}9[0-9]{4}[0-9]?[0-9]{3}/
    self.errors.add :phone, "#{I18n.t('activerecord.attributes.profile.phone')} #{I18n.t('flash.invalid')}"
    end
  end

  def validate_ibge
    unless self.state_ibge == self.county_ibge[0..1]
      self.errors.add :state_ibge, "#{I18n.t('activerecord.attributes.profile.county_ibge')} #{I18n.t('flash.invalid')}"
    end
  end

  def purge_attached_files
    self.photo.purge
    self.banner.purge
    self.selfie.purge
    self.legal_doc.purge
    self.signature.purge
    self.third_part_receive_equipments.purge
    self.bank_orders_receipts.purge
  end
end
