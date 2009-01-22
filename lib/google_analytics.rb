module GoogleAnalyticsHelper
	def google_analytics(code)
		html = %{
			<script type="text/javascript">
			var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
			document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
			</script>
			<script type="text/javascript">
			try {
			var pageTracker = _gat._getTracker("UA-#{code.to_s}-1");
			pageTracker._trackPageview();
			} catch(err) {}</script>
		}
		html
	end
end

Webby::Helpers.register(GoogleAnalyticsHelper)