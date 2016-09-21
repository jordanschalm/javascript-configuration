# Initiate a new project from the root directory
npm init # Answer the prompts

##################################
## (1) Setting up transpilation ##
##################################
# Loader and Core are required for using Webpack. Polyfill is useful and required for Jest.
npm install --save babel-loader babel-core babel-polyfill
# Remove React from the following if not applicable
npm install --save babel-preset-es2015
# Configure Babel
printf \
'{
\t"presets": ["es2015"]
}' > .babelrc
# Install Webpack
npm install --save webpack
# Configure Webpack. Change `entry` and `output` as needed
mkdir src && mkdir bin && echo "console.log('hello')" > src/app.js
printf \
'module.exports = {
\tentry: "./src/app.js",
\toutput: {
\t\tpath: "./bin",
\t\tfilename: "app.bundle.js"
\t},
\tmodule: {
\t\tloaders: [{
\t\t\ttest: /\.js$/,
\t\t\texclude: /node_modules/,
\t\t\tloader: "babel-loader"
\t\t}]
\t}
};' > webpack.config.js
# Add build script to package.json => `"build": "webpack"`

############################
## (2) Setting up linting ##
############################
# Install ESLint packages
npm install --save-dev eslint-config-ubclaunchpad eslint-config-airbnb babel-eslint eslint-plugin-import eslint-plugin-react eslint-plugin-jsx-a11y eslint
# Configure ESLint
printf \
'{
\t"extends": "eslint-config-ubclaunchpad"
}' > .eslintrc
# Add eslint script to package.json => `"eslint": "eslint src"`

############################
## (3) Setting up testing ##
############################
npm install --save-dev jest babel-jest
# Add test script to package.json => `"jest": "jest"`
# All tests go in `**/__tests__/*.test.js`

#######################
## (4) Setting up CI ##
#######################
# Configure TravisCI
printf \
'language: node_js
node_js:
\t- 6
' > .travis.yml

#############################
## (5) Setting up coverage ##
#############################
npm install --save-dev coveralls
# Add coverage script to package.json => `"coverage": "jest --coverage"`
# Add coveralls script to package.json => "npm run coverage && cat ./coverage/lcov.info | coveralls && rm -rf coverage"`
# Add to TravisCI configuration
printf \
'after_success:
\t- npm run coveralls' >> .travis.yml

##########################
## (6) Setting up React ##
##########################
# Install React itself
npm install --save react react-dom
# Install Babel preset for transpiling JSX
npm install --save babel-preset-react
# Install plugin for using static members in components
npm install --save babel-plugin-transform-class-properties
# Update Babel configuration
printf \
'{
\t"presets": ["es2015", "react"],
\t"plugins": ["transform-class-properties"]
}' > .babelrc
# Install Enzyme for testing React components
npm install --save-dev enzyme
