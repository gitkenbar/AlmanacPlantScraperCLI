# About:
This CLI scrapes data from Almanac.com and effortlessly displays it for the user.

# To-Do:
### README.md
Add technical documentation in the README.md file

### plant.rb
pests un-ordered list selector does not work properly

### auth.rb
Add a reset password option

### scraper.rb

Add more comprehensive error handling
  - predict edge case issues
    - "()" removal is the only one I can see
    - The plant list has entries with "()" in them, but parenthesis are not in the URL and should be removed
    - zucchini appears on vegetable list as Zucchini and Summer Squash, but the URL is just zucchini
    - should try to make plural if input is missing "s" or "es"