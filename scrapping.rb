require "Nokogiri"
require "open-uri"

def get_the_email_of_a_townhal_from_its_webpage(url)

	townhal_page = Nokogiri::HTML(open(url))
	townhal_mails_array = []
	townhal_page.css("p.Style22").map do |lign|
		if lign.text.include?("@")
			lign.text
		end
	end
end


def get_all_the_urls_of_paris_townhalls

	list_page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/paris.html"))
	name_and_mail_hash = Hash.new

	list_incomplete_url = list_page.css("a.lientxt").each do |lign|
		url = "http://annuaire-des-mairies.com" + lign["href"]
		townhal_mail = get_the_email_of_a_townhal_from_its_webpage(url).compact
		townhal_mail = townhal_mail[0]
		town_name = lign.text
		name_and_mail_hash[town_name] = townhal_mail
	end
	return name_and_mail_hash
end