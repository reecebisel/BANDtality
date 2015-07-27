$('#myTabs a').click(function (e) {
  e.preventDefault()
  $('#myTabs a[href="#inbox"]').tab('show')
	$('#myTabs a[href="#sent"]').tab('show')
	$('#myTabs a[href="#read"]').tab('show')
	$('#myTabs a[href="#unread"]').tab('show')
})