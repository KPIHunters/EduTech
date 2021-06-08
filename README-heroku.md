
1. heroku git:remote -a staging-edu-kpi
1. Check ruby versions supported by heroku & update it project to it version
1. Add buildpacks:
    1. add ruby: ``` heroku buildpacks:add --index 1 heroku/nodejs ```
    1. add nodejs: ``` heroku buildpacks:add --index 1 heroku/nodejs ```
1. Add config var: RAILS_SERVE_STATIC_FILES=true
1. --> ADD RSPEC SKIP AT RAKEFILE
1. heroku buildpacks:add -i 1 https://github.com/heroku/heroku-buildpack-activestorage-preview
1. heroku run bash

Heroku seems to work well with bundler version 2.1.4. (not sure why) 
In my case I had to downgrade to version 2.1.4 and make it the default: ```` gem install bundler -v 2.1.4 ````

TRUNCATE:
```sql 
   TRUNCATE TABLE periods CASCADE;
   TRUNCATE TABLE lessons; 
```
