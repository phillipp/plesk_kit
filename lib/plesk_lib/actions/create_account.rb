class PleskLib::Actions::CreateAccount < PleskLib::Actions::Base
  def build_gen_info(xml, account, tag_name = 'gen_info')
    xml.tag!(tag_name) {
      xml.cname(account.company_name)
      xml.pname(account.person_name)
      xml.login(account.login) if account.login.present?
      xml.passwd(account.password) if account.password.present?
      xml.pcode(account.pcode) if account.postal_code.present?
      %w(status phone fax address city state email country).each do |attribute|
        value = account.send(attribute)
        xml.tag!(attribute, value) if value.present?
      end
      xml.tag!('owner-id', account.owner_id) if account.owner_id.present?
    }
    return xml.target!
  end

  def analyse(xml_document)
    if xml_document.root.elements['//id'].present?
      @plesk_id = xml_document.root.elements['//id'].text.to_i
    end
  end
end
