// ==UserScript==
// @name           Reddit to Libreddit redirector
// @namespace      Custom userscripts
// @match          *://*.reddit.com/*
// @run-at         document-start
// ==/UserScript==

function test(url){
    return !!url.match(/^(|http(s?):\/\/)(.*\.)?reddit.com(\/.*|$)/gim);
}

function getNewPagePlease(url){
    return 'https://libreddit.spike.codes' + url.split('reddit.com').pop();
}

if(test(window.location.href)){window.location.assign(getNewPagePlease(window.location.href));}
