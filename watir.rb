require 'watir'
#browser = Watir::Browser.new
browser = Watir::Browser.new(:firefox)
#search_bar = browser.text_field(attribut: 'réglage_de_lattribut')
browser.goto 'google.com'
search_bar = browser.text_field(class: 'gsfi')
search_bar.set("Hello World!")
search_bar.send_keys(:enter)
#submit_button = browser.button(type:"submit")
#submit_button.click

# nous allons dire à notre programme d'attendre un peu avant de continuer,
# sinon il va faire ceci avant que la page n'ait le temps de se charger
browser.driver.manage.timeouts.implicit_wait = 3



# on peut récupérer des divs et spans
search_result_divs = browser.divs(class:"rc")
search_result_divs.each { |div| p div.h3.text }

p "Méfait accompli, fermeture du browser"
browser.close
