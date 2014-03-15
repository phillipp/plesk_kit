module PleskLib
  class Reseller
    attr_accessor :company_name, :login, :password, :person_name, :status,
                  :phone, :fax, :address, :city, :state, :email, :country,
                  :postal_code, :service_plan_id

    def initialize(login, other_attributes = {})
      @login = login
      other_attributes.each_pair do |key, value|
        send("#{key}=", value)
      end if other_attributes.present?
    end
  end
end
