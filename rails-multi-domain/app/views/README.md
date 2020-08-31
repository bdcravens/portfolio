Page Titles
===========

Layout uses 2 helpers for page title: page_title and page_subtitle
(see application_helper.rb)

These can be overridden at the view level as follows:

```<% content_for :page_title do %>Admin Dash<% end %>```

page_title defaults to "Dashboard"

```<% content_for :page_subtitle do %>Charts and graphs that make Brian smile<% end %>```

page_subtitle defaults to ""

