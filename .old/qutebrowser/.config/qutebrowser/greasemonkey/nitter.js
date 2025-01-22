// ==UserScript==
// @name           Twitter to Nitter redirector
// @namespace      Custom userscripts
// @match          https://twitter.com/*
// @match          https://www.twitter.com/*
// @run-at         document-start
// ==/UserScript==

location.href = location.href.replace("twitter.com", "nitter.net");
