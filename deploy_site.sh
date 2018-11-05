echo "GitHub Username (make sure you have write permissions first!): "

read $name

cd website

GIT_USER=$name \
  CURRENT_BRANCH=master \
  USE_SSH=true \
  npm run publish-gh-pages
