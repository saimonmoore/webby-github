module GistHelper
	
	def gist(repo)
		%(<script type="text/javascript" src="http://gist.github.com/#{repo.to_s}.js"></script>)
	end
	
end

Webby::Helpers.register(GistHelper)