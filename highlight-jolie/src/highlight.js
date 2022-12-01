const hljs = require('highlight.js/lib/common')
const hljsXML = require('highlight.js/lib/languages/xml')
const hljsJolie = require('highlightjs-jolie')
hljs.configure({ ignoreUnescapedHTML: true })

hljs.registerLanguage('jolie', hljsJolie)
hljs.registerLanguage('xml', hljsXML)
hljs.highlightAll()
window.hljs = hljs
