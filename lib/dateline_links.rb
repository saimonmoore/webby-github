module DatelineLinksHelper
	
	def dateline_links(page)
		time					= page.created_at
		day_number		= time.strftime("%d")
		day_name			= time.strftime("%A")
		month_number	= time.strftime("%m")
		month_name		= time.strftime("%B")
		year					= time.strftime("%Y")
		
		html = %(<span class="dateline">\n#{day_name}, <a href="blog/#{year}/#{month_number}/index.html">#{month_name}</a>)
		html += %( #{day_number}, <a href="blog/#{year}/index.html">#{year}</a></span>)
		html
	end
	
	def dateline(page)
		time = page.created_at
		day = time.strftime("%d")
		month = time.strftime("%B")
		year = time.strftime("%Y")
		html = %(<span class="dateline">#{month} #{day}, #{year} :: </span>)
		html
	end
	
	def post_page_dateline(page)
		time = page.created_at
		html = %(<em>#{time.strftime("%A %B %d, %Y")}</em>)
		html
	end
	
end

Webby::Helpers.register(DatelineLinksHelper)