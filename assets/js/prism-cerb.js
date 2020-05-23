Prism.languages.cerb = {
  'key': {
    pattern: /(\s*)[a-zA-Z0-9\_\-\.\,\/\@\&]*(:)/,
    lookbehind: true,
    lookahead: true,
    alias: 'atrule'
  },
  'property': {
    pattern: /\{\{[a-zA-Z0-9\_\-\.]*\}\}/
  },
  'comment': {
    pattern: /\{\#.*\#\}/,
    greedy: false
  }
};
