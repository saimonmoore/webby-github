
# See if we have the JSMin gem installed
if try_require('jsmin', 'jsmin')
	Webby::Filters.register :jsmin do |input|
		JSMin.minify(input)
	end
else
	Webby::Filters.register :jsmin do |input|
		raise Webby::Error, "The 'JSMin' gem must be installed to use this filter"
	end
end