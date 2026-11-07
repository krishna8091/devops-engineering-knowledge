docker-practice: a small practice app for Docker (all data is made up)

THE APP
  app.py is a tiny web page (Flask). Open / to see JSON with a visit counter.

WHAT IS IN THIS FOLDER
  app.py            the web app
  requirements.txt  Python packages (just Flask)
  Dockerfile        the BLOATED, risky Dockerfile (Claude will fix it)
  .env              FAKE secrets, made up. They should NEVER end up in an image

RULES
  1. Nothing here is real. Never put real passwords in a Dockerfile or .env that you share.
  2. Read what Claude writes before you build or run it.
  3. If port 5000 is busy on your laptop, use 5001:5000 and open localhost:5001.
