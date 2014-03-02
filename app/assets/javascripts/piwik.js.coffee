# this code snippet ensures compatibility of piwik_analytics with rails turbolinks
# ->http://reed.github.io/turbolinks-compatibility/piwik.html

$(document).on 'page:change', ->
  if window._paq?
    _paq.push ['trackPageview']
  else if window.piwikTracker?
    piwikTracker.trackPageview()