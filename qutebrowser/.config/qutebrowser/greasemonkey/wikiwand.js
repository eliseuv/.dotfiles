// ==UserScript==
// @name           Wikipedia to Wikiwand redirector
// @namespace      Custom userscripts
// @match          https://en.wikipedia.org/wiki/*
// @run-at         document-start
// ==/UserScript==

location.href = location.href.replace("en.wikipedia.org/wiki", "wikiwand.com/en");
