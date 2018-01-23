require "google_drive"
require "gmail"
require_relative "scrapping"
require_relative"get_the_email_html"
require "pry"

# Créer un spreadsheet et le remplir avec un hash connu (le nom en colonne A, le mail en colonne B)

def create_a_spreadsheet_and_fill_it_with_a_hash
	session = GoogleDrive::Session.from_config("config.json")
	spreadsheet = session.create_spreadsheet(title = "Mails des Mairies de Paris")
  		ws = spreadsheet.worksheets[0]

	my_hash = get_all_the_urls_of_paris_townhalls

	n = 1
	my_hash.each do |townhal_name, mail|
		ws[n,1] = townhal_name
		ws[n,2] = mail
		n += 1
	end
	ws.save
	return ws
end

# Envoyer un mail au "mail" en colonne B du spreasheet, correspondant au "townhal_name" en colonne A

def send_email_to_line(mail, townhal_name)

	gmail = Gmail.connect("sophie.tochon@gmail.com", "C8XxXe!g")
	gmail.deliver do

		to mail
		subject "Hello from The Hacking Project"
		html_part do
    		content_type "text/html; charset=UTF-8"
    		body get_the_email_html(townhal_name)
   		end
	end
end

# Appliquer la méthode send_email_to_line à chaque ligne du spreadsheet créé par la première méthode

def go_through_all_the_lines

	ws = create_a_spreadsheet_and_fill_it_with_a_hash

	(1..ws.num_rows).each do |row|

		mail = ws[row, 2][1..100]
		townhal_name = ws[row, 1]

		send_email_to_line(mail, townhal_name)
	end
end

go_through_all_the_lines
