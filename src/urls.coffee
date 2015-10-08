{Splash} = require "am/views/splash"
{Home} = require "am/views/home"
{Login} = require "am/views/login"
{Join} = require "am/views/join"
{Discuss} = require "am/views/discuss"
{AddTopic} = require "am/views/add-topic"
{Explore} = require "am/views/explore"
{Search} = require "am/views/search"
{Project} = require "am/views/project"
{Topic} = require "am/views/topic"

urls =
  "/": (d) -> new (if d.app.server.user then Home else Splash) d
  "/home": Home
  "/login": Login
  "/join": Join
  "/explore": Explore
  "/discuss": Discuss
  "/discuss/new": AddTopic
  "/discuss/s/:filter": Discuss
  "/discuss/t/:tag": ({app, tag}) -> new Discuss {app, filter: "[#{tag}] "}
  "/topic/:id": Topic
  "/search/:query": Search
  "/project/:id": Project

module.exports = {urls}
