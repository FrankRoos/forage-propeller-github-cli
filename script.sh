mkdir forage-propeller-github-cli
cd forage-propeller-github-cli
npm init react-app my-app
cd my-app
git init
git add .
git commit -m "First commit: init react app"
# Authenticate against github.com by reading the token from a file
gh auth login --with-token < mytoken.txt
# create a remote repository from the current directory
gh repo create forage-propeller-github-cli --public --source=. --remote=upstream
# Push the changes to the remote repository
git remote add origin git@github.com:FrankRoos/forage-propeller-github-cli.git
git push -u origin main
git switch -c update_logo
cd src/
rm logo.svg
# https://www.propelleraero.com/wp-content/uploads/2021/05/Vector.svg return 404
# Download the logo from the propeller website and save it in the src directory
wget https://cdn-ikponof.nitrocdn.com/vGqfYAGlOLDkYkJqZhYIYKEsibdbZnkc/assets/images/source/rev-c0d692a/www.propelleraero.com/wp-content/uploads/2023/05/logo.svg
cd ../
# Update the logo in the App.js file
git commit -a -m "Update logo and existing link"
# Push the changes to the remote repository
git push --set-upstream origin update_logo
# Create a pull request
gh pr create --base main --head update_logo --title "Update Logo" --body "This PR updates the logo and the existing link."
# Merge the pull request
gh pr merge --rebase
