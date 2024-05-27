if [ -z "$UPSTREAM_REPO" ]; then
  echo "Cloning main Repository"
  git clone https://github.com/lazyindu/test1.git /LazyPrincess || { echo "Failed to clone main repository"; exit 1; }
else
  echo "Cloning Custom Repo from $UPSTREAM_REPO "
  git clone "$UPSTREAM_REPO" /LazyPrincess || { echo "Failed to clone custom repository"; exit 1; }
fi

cd /LazyPrincess || { echo "Failed to change directory to /LazyPrincess"; exit 1; }

pip3 install -U -r requirements.txt || { echo "Failed to install Python dependencies"; exit 1; }

echo "Starting Bot...."
python3 bot.py || { echo "Failed to start the bot"; exit 1; }
