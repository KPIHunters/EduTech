class GovIdValidator < ActiveModel::Validator
  def validate(record)
    if gov_id.nil?
      record.errors.add :gov_id, "#{t('activerecord.attributes.profile.gov_id')} #{t('flash.mandatory')}"
    end

    if (gov_id.length == 11 && !CPF.valid?(gov_id, strict: true)) || (gov_id.length == 14 && !CPF.valid?(gov_id, strict: true))
      record.errors.add :gov_id, "#{t('activerecord.attributes.profile.gov_id')} #{t('flash.invalid')}"
    end
  end
end