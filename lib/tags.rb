module TagsHelper
	
	def tags(page)
		tags = page.tags
		html = %(<strong>Tags:</strong><ul class="tags">\n)
		tags.each do |tag|
			html += %(<li>#{tag}</li>\n)
		end
		html += %(</ul>)
		html
	end
	
end

Webby::Helpers.register(TagsHelper)