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
  
Using url = https://aniwatcher.com/anime-list
  need Nokogiri and open uri 
doc.css(".genre").text = genres
