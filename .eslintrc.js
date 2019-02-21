module.exports = {
    "env": {
        "browser": true,
        "es6": true,
    },
    "extends": ["eslint:recommended", "standard"],
    "globals": {
        "Atomics": "readonly",
        "SharedArrayBuffer": "readonly",
    },
    "parserOptions": {
        "ecmaVersion": 2018,
    },
    "plugins": [
        "vue",
    ],
    "rules": {
        "indent":                   ["error", 4],
        "comma-dangle":             ["error", "only-multiline"],
        "semi":                     ["error", "always"],
        "template-curly-spacing":   ["error", "always"],
        "no-multiple-empty-lines":  ["error", { "max": 3, "maxEOF": 1 }],
        "camelcase":                [0],
    },
    "globals": {
        "Vue":        "readonly",
        "Vuex":       "readonly",
        "VueRouter":  "readonly",
        "axios":      "readonly",
    },
};
