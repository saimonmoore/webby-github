function gitFeed(feed) {
	var tmp = '';
	for (var i=0; i<feed.value.items.length; i++) {
		var title = feed.value.items[i].title.replace('mikedamage', 'Mike');
		tmp += '<li>'+'<a href="'+feed.value.items[i].link+'" target="_blank">'
			+ title
			+ '</a> <br/><em>'+jQuery.timeago(feed.value.items[i].pubDate)+"</em></li>\n";
	}
	jQuery("#github-commits .loading").hide('fast');
	jQuery("#github-commits ul").append(tmp);
}

function deliciousFeed(feed) {
	var tmp = '';
	for (var i=0; i<feed.value.items.length; i++) {
		tmp += '<li><a href="'+feed.value.items[i].link+'" target="_blank">'
		+ feed.value.items[i].title
		+'</a><br/><em>'+jQuery.timeago(parseDate(feed.value.items[i].pubDate))+"</em></li>\n";
	}
	jQuery("#delicious-bookmarks .loading").hide('fast');
	jQuery("#delicious-bookmarks ul").append(tmp);
}

function twitterFeed(feed) {
	for (var i=0; i<feed.length; i++) {
		$('#twitter-status ul')
			.hide()
			.append('<li class="tweet">'
				+ feed[i].text
				+ '<br/><em>'
				+ jQuery.timeago(parseDate(feed[i].created_at))
				+ '</em>'
				+ '</li>')
			.show('fast');
		$("#twitter-status .loading").hide('fast');
	}
}

function lastFmFeed(feed) {
	var tmp = '';
	for (var i=0; i<feed.recenttracks.track.length; i++) {
		tmp += feed.recenttracks.track[i].name + ", ";
	}
	console.log(tmp);
}

function parseDate(date) {
	var dateArray = date.split(" ");
	var dateString = dateArray[1]+" "+dateArray[2]+", "+dateArray[5]+" "+dateArray[3]+" "+dateArray[4];
	return dateString;
}