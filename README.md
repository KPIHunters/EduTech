# Public Tech Teach Platform
Teach technology with open source platform & public content to bring tech knowledge for everyone

# Node version fix

1. npm install -g n
2. sudo n stable
3. curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
4. Add to ~/.zshrc & ~/.bash_profile :

export NVM_HOME=/Users/your-user/.nvm
export PATH=${PATH}:${NVM_HOME}
source ${NVM_HOME}/nvm.sh

6. nvm install 14.18.1
7. nvm use 14.18.1
8. npm i -g yarn
9. yarn install --check-files
10. IF "Please run `yarn install --check-files` to update." -> remove node_module & run: yarn install --check-files 

# Omniauth

1. Production Callback: https://cidadaniatech.kpihunters.com/users/auth/github/callback
2. Development Callback: http://localhost:8000/users/auth/github/callback

# GraphViz

```shell
   $ brew install graphviz
```

# SSL
Localhost HTTPS para testes como o do facebook: https://rossta.net/blog/local-ssl-for-rails-5.html#resolve-a-domain-name-to-localhost
--> O SSL QUE FUNCIONOU FOI O DO HEROKU: https://devcenter.heroku.com/articles/ssl-certificate-self
--> O tutorial do SSL do heroku está no dropbox

Trust SSL: sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain config/ssl/server.crt

Executando rails com SSL: rails s -b 'ssl://0.0.0.0:3000?key=config/ssl/server.key&cert=config/ssl/server.crt'

puma -b 'ssl://0.0.0.0:3000?key=config/ssl/server.key&cert=config/ssl/server.crt'

RUBY MINE CONFIG: __Server Arguments__ = -b "ssl://0.0.0.0:3000?key=config/ssl/server.key&cert=config/ssl/server.crt"

--> IF locahost takes so long, it is HTTP not HTTPS, CHECK IT

# RubyMine

## SSL RubyMine
Add ao Server Arguments: -b "ssl://localhost:3000?key=config/ssl/server.key&cert=config/ssl/server.crt"

## Docker Debug RubyMine
README-wsl-rubymine.md

# PostGreSQL

1. Install
    ```shell
      sudo apt update
      sudo apt install postgresql postgresql-contrib
    ```
1. LogIn
    ```shell
      sudo -i -u postgres
    ```

# Ubuntu Services (Databases) 

1. Status Check
   ```shell
      service --status-all
   ```
1. Start MySQL
   ```shell
      service mysql start
   ```
1. Start Postgres
   ```shell
      service postgresql start
   ```
1. [Setup AWS S3](https://devcenter.heroku.com/articles/s3)

1. ActiveStorage Upload files: /config/storage.yml

# Postgres MAC

1. Install: ``` brew doctor && brew update && brew install postgresql postgres ```
1. Start: ``` brew services start postgresql ```
1. Access postgres and alter:
   1. Access: ``` psql postgres ```
   1. Inside database:
      1. ``` CREATE ROLE postgres WITH LOGIN PASSWORD 'postgres'; ```
      1. ``` ALTER ROLE postgres CREATEDB; ```
      1. ``` ALTER USER postgres CREATEDB; ```
      1. exit ``` \q ```
      1. ``` CREATE ROLE pguser WITH LOGIN PASSWORD 'pguser'; ```
      1. ``` ALTER ROLE pguser CREATEDB; ```
      1. ``` ALTER USER pguser CREATEDB; ```
      1. ``` GRANT ALL PRIVILEGES ON DATABASE schema_migrations to pguser; ```
      1. exit ``` \q ```

# Cron Whenever
1. install the gem
1. write your scheduler.rb file
1. push to the remote server
1. login to the remote server (for example with ssh)
1. see if whenever is good uploaded by running in terminal: whenever
1. update whenever crontab by running:  whenever --update-crontab --set environment=development
1. restart the server crontab (for example in Ubuntu server): sudo service cron restart
1. check if crontab is good implemented on the server: crontab -l

# Second Factor Authentication

[Works with Google Authenticator](https://github.com/tinfoil/devise-two-factor)

At Tinfoil Security, we opted to use the excellent rqrcode-rails3 gem to generate a QR-code representing the user's secret key, which can then be scanned by any mobile two-factor authentication client.

If you decide to do this you'll need to generate a URI to act as the source for the QR code. This can be done using the User#otp_provisioning_uri method.
```ruby
issuer = 'Your App'
label = "#{issuer}:#{current_user.email}"

current_user.otp_provisioning_uri(label, issuer: issuer)
```

``` # > "otpauth://totp/Your%20App:user@example.com?secret=[otp_secret]&issuer=Your+App" ```

If you instead to decide to send the one-time password to the user directly, such as via SMS, you'll need a mechanism for generating the one-time password on the server:
```ruby
current_user.current_otp
```

You can then generate backup codes for a user:
```ruby
codes = current_user.generate_otp_backup_codes!
current_user.save!
# Display codes to the user somehow!
```

/Embed video with options (get PLAYLIST IDs)
/https://support.google.com/youtube/answer/171780?hl=pt-BR

/Like & Dislike button API
/https://developers.google.com/youtube/v3/docs/videos/rate?apix_params=%7B%22id%22%3A%227NBYczDosGs%22%2C%22rating%22%3A%22like%22%7D&apix=true

/OAuth Localhost setup
/https://developers.google.com/identity/protocols/oauth2/web-server
