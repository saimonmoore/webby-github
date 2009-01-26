module NavigationLinksHelper
	
	def navigation_links(page)
		list = %(<ul class="navigation">\n)
		@pages.children(page) do |p|
			next if p.navigation_item != "true"
			if p.title == page.title
				list += %(<li class="active">#{p.title}</li>)
			else
				list += %(<li>#{link_to_page(p)}</li>)
			end
		end
		list += %(</ul>)
		list
	end
	
end

Webby::Helpers.register(NavigationLinksHelper)