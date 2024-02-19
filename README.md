# About:
This CLI scrapes data from Almanac.com and effortlessly displays it for the user.

# To-Do:
### README.md
Add technical documentation in the README.md file

### plant.rb
Dynamically format paragraphs so that they render beautifully onto the page

### auth.rb
Add a reset password option

### scraper.rb
Learn to use advanced Nokogiri functions and selectors to better format data pulled!

Add more comprehensive error handling
  - predict edge case issues
    - "()" removal is the only one I can see
    - The plant list has entries with "()" in them, but parenthesis are not in the URL and should be removed
    - zucchini appears on vegetable list as Zucchini and Summer Squash, but the URL is just zucchini