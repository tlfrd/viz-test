Visualisation.create!([
  {title: "US Choropleth", html: "https://gist.githubusercontent.com/tlfrd/6e598db83cab2c1163e03f4f35290ff5/raw/ae0b80b6f6bbbe2345cd2e9ec73f1b0655edc0d7/index.html", img_src: "https://gist.githubusercontent.com/tlfrd/6e598db83cab2c1163e03f4f35290ff5/raw/0eb4c26e1b6cc523c6ca9b3ea5700e639c853f25/thumbnail.png"},
  {title: "Kentucky Choropleth", html: "https://gist.githubusercontent.com/tlfrd/4300e28a662929aed8168398a1cba836/raw/ec5d8aca96b370ec71cdcf4923ed3f22f8391b4c/index.html", img_src: "https://gist.githubusercontent.com/tlfrd/4300e28a662929aed8168398a1cba836/raw/f3ef8bc51662b9784ef00ac7f064fb274e68a2fa/thumbnail.png"},
  {title: "Bubble Map", html: "https://gist.githubusercontent.com/tlfrd/18fcd399b66ed7077ed31d02896e3262/raw/8c8c79129059211c264e6458a8e53f5a2496a467/index.html", img_src: "https://gist.githubusercontent.com/tlfrd/18fcd399b66ed7077ed31d02896e3262/raw/ef7bfac797fcfa048ac5e6f82aa95ba01896dd76/thumbnail.png"}
])
Task.create!([
  {name: "US Choropleth Highest Point", visualisation_id: 1, task_type: "Click", description: "Where is the highest point?", no_of_clicks: 1},
  {name: "Kentucky Choropleth Two Highest Points", visualisation_id: 2, task_type: "Click", description: "Where are the two highest points?", no_of_clicks: 2},
  {name: "Bubble Map Three Highest Points", visualisation_id: 4, task_type: "Click", description: "Where are the three highest points?", no_of_clicks: 3},
])
