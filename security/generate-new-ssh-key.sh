#!/bin/sh

# Creates a new ssh key
# ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
# ssh-keygen -t rsa -b 4096 -C "felipetavaresmelo@gmail.com" # Legado
ssh-keygen -t ed25519 -C "felipetavaresmelo@gmail.com"


# Start the ssh-agent in the background
eval "$(ssh-agent -s)"

# Add your SSH private key to the ssh-agent
# ssh-add ~/.ssh/id_rsa # Legado
ssh-add ~/.ssh/id_ed25519

# copy pub key to the clipboard
sudo apt-get install xclip
xclip -sel clip < ~/.ssh/id_ed25519.pub


sudo apt install curl

https://github.com/login
<input type="text" name="login" id="login_field" class="form-control input-block" tabindex="1" autocapitalize="off" autocorrect="off" autocomplete="username" autofocus="autofocus">
<input type="password" name="password" id="password" class="form-control form-control input-block" tabindex="2" autocomplete="current-password">
<input type="submit" name="commit" value="Sign in" tabindex="3" class="btn btn-primary btn-block" data-disable-with="Signing in…">

https://github.com/sessions/two-factor
<input type="text" name="otp" id="otp" value="" autocomplete="one-time-code" autofocus="autofocus" class="form-control input-block" inputmode="numeric" pattern="([0-9]{6})|([0-9a-fA-F]{5}-?[0-9a-fA-F]{5})" placeholder="6-digit code">
<button class="btn btn-primary btn-block" data-disable-with="Verifying…" type="submit">Verify</button>

curl https://github.com/settings/ssh/new
<input class="form-control" type="text" name="public_key[title]" id="public_key_title">
<textarea class="form-control key_value" placeholder="Begins with 'ssh-rsa', 'ssh-ed25519', 'ecdsa-sha2-nistp256', 'ecdsa-sha2-nistp384', or 'ecdsa-sha2-nistp521'" name="public_key[key]" id="public_key_key"></textarea>
<button type="submit" class="btn btn-primary" data-disable-with="">Add SSH key</button>