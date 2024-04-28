div id=("#{dom_id article}") 
  .grid.grid-cols-3.gap-4
    div
      span.font-medium.font-bold.m-1 Title:
      = article.title
    div
      span.font-medium.font-bold.m-1 Category:
      = article.category
    div
      - if action_name != "show"
        = link_to "Show this article", article, class: "rounded p-1 bg-blue-100 inline-block font-medium"
        = link_to 'Edit this article', edit_article_path(article), class: "rounded p-1 ml-2 bg-green-100 inline-block font-medium" if Current.user
  div
    div.inline-block
      span.font-medium.font-bold.m-1 Content Lead-In:&nbsp;
    div.inline-block
      = article.content[0..100]
      span …
  hr.mb-2

