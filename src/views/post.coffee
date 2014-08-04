{View} = require "scene"
{parse} = require "markup"
{T} = require "am/util"
{RelativeDate} = require "am/views/relative-date"

class Post extends View
  @content: ({app, d: {author, created, body}}) ->
    @section class: "post", =>
      @img src: "http://lorempixel.com/100/100/abstract/1"
      @div class: "author", =>
        @a outlet: "author", href: "/user/#{author}"
        @text " posted "
        @subview new RelativeDate created
        @button T("edit"), class: "menu" if author is app.server.user?.id
        @button T("report"), class: "menu"
      @html parse(body).result

  initialize: ({@app, @d, pending}) ->
    app.server.getUser @d.author, (err, user) =>
      @author.textContent = user.name if user
    @setPending pending

  setPending: (pending) -> @base.classList.toggle "pending", pending

module.exports = {Post}
