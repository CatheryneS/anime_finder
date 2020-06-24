Nikki is looking to start watching a new anime series, but she wants to narrow it down by categorizes.
Crunchyroll is down for a little while and myanimelist has crashed (the horror). But she is in luck.
We have a new CLI App called "Anime Finder" that will:
  Give her a list of categorizes to chose form 
  Then a list of anime fitting that categorize 
  Then she can pick an anime by number and it will give her a summary
  If she doesn't like it she can go back and pick from that same list or back to the categorizes
  
Choosing Classes
  One will scrap a website for data/anime list, categorizes, and summaries (Scraper)
  One will store the data if it has already been gotten (Anime Expert)
  One will ask Nikki what she would like to do (CLI/anime finder)
  
Using url = https://aniwatcher.com/anime-list or https://www.crunchyroll.com/videos/anime?utm_source=paid_cr&utm_medium=google_sem&utm_campaign=brand_sitelink&referrer=GoogleSEM&utm_source=paid_cr&utm_medium=google-ads&utm_campaign=search-conversion&utm_term=crunchyroll&referrer=paid_cr_google-ads_search-conversion&gclid=Cj0KCQjw0Mb3BRCaARIsAPSNGpVLVf0o_zIdbnZFyBijufPZF7V2PvuRd5RDFzO_uz8OF56KxFyrYl4aAoypEALw_wcB
  need Nokogiri and open uri 
doc.css(".genre").text = genres

May have to put limit on how many animes display at one time

Next need to get summaries displaying
  Wont be in a list format, will only show the summary of the show
  Purely scraper's job to obtain and CLI's job to display..?
  
scrape for genres and one for dsc.

The AnimeExpert class needs to:
  store data about animes that have already been scraped
    -> anime title
    -> summaries
    -> number of episodes
    -> year created 
    
The Scraper class needs to:
    -> grab genres and animes belonging to them
      -> they have separate urls for each genre(s) may have to scrape each separatly 
          -> work on one genre page first to get everything working then add the other urls
    -> define a method for scraping the details for each anime 
      -> anime title
      -> summaries
      -> episodes
      -> year created
      
Class Relationships
  Anime belongs to many genres
  
use an @@all for the animes to get the list of animes? 
  -> how to show each shows details