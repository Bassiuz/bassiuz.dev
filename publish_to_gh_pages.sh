    fvm flutter build web --web-renderer html --release --no-tree-shake-icons
    # GitHub Pages serves 404.html for unknown paths, so deep links like /ai/en boot the app.
    cp build/web/index.html build/web/404.html
    git push origin --delete gh-pages
    git add build/web/ -f
    git commit -m "publish new web version"
    git push
    git subtree push --prefix build/web origin gh-pages