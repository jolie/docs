var hljs = require('highlight.js/lib/common');
var hljsXML = require('highlight.js/lib/languages/xml');
var hljsJolie = require('highlightjs-jolie');
hljs.configure({ ignoreUnescapedHTML: true })

hljs.registerLanguage("jolie", hljsJolie);
hljs.registerLanguage("xml", hljsXML);
hljs.highlightAll();
window.hljs = hljs;
