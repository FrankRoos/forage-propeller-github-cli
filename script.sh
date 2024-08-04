git add .
git commit -m "First commit: init react app"
gh repo create forage-propeller-github-cli --public --source=. --remote=upstream
gh repo sync