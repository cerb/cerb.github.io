Prism.languages.cerb = {
  'comment': {
    pattern: /(^|\r|\n)(\s*)#.*(\r|\n|$)/,
    lookbehind: true,
    lookahead: true
  },
  'key': {
    pattern: /(\s*)[a-zA-Z0-9\_\-\.\,\/\@\&]*(:)/,
    lookbehind: true,
    lookahead: true,
    alias: 'atrule'
  },
  'property': {
    pattern: /\{\{[a-zA-Z0-9\_\-\.]*\}\}/
  }
};