#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
	xml.channel do
		xml.title "Blogger on Rails"
		xml.author "Fabricio Carrara"
		xml.description "Application developed in Ruby on Rails as part of The Odin Project"
		xml.link root_url
		xml.language "en"

		for article in @articles
			xml.item do
				xml.title article.title
				xml.author article.author
				xml.pubDate article.created_at.to_s
				xml.guid article.id
				text = article.body
				if article.image.exists?
					image_url = article.image.url(:large)
					image_align = ""
					image_tag = "<p><img src='" + image_url +  
									  "' align='" + image_align  + "' /></p>"
					text = text.sub("{image}", image_tag)
				end
				xml.description = "<p>" + text + "</p>"
			end
		end
	end
end