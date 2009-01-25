# breadcrumbs.rb

module BreadcrumbsHelper
  # call-seq:
  #    breadcrumbs( page )    => html
  #
  # Create breadcrumb links for the current page. This will return an HTML
  # <ul></ul> object.
  #
  def breadcrumbs( page )
    list = ["<li class=\"last\">#{h(page.title)}</li>"]
    loop do
      page = @pages.parent_of(page)
      break if page.nil?
      list << "<li>#{link_to_page(page)} <span class=\"angle_brackets\">&raquo;</span></li>"
    end
    list.reverse!

    html = "<ul class=\"breadcrumbs\">\n"
    html << list.join("\n")
    html << "\n<div class=\"clear\">&nbsp;</div>\n</ul>\n"
    html
  end
end  # module Breadcrumbs

Webby::Helpers.register(BreadcrumbsHelper)

# EOF
