class ContactDetail < ApplicationRecord
  validates_presence_of :name,:email,:mobile_no,:message
  EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\z/
  validates_format_of :email, with: EMAIL_REGEX
  PHONE_REGEX = /\A[0-9]*\Z/
  validates_format_of :mobile_no,with: PHONE_REGEX
  validates :mobile_no,length: { is: 10 }

end
