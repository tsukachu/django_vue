var BundleTracker = require('webpack-bundle-tracker');

module.exports = {
  publicPath: process.env.NODE_ENV === 'production'
            ? '/static/dist/'
            : 'http://localhost:8080/',
  outputDir: 'static/dist',
  configureWebpack: {
    plugins: [
      new BundleTracker({filename: './webpack-stats.json'}),
    ],
  },
  css: {
    sourceMap: true,
  },
  devServer: {
    headers: {
      'Access-Control-Allow-Origin': '*',
    },
  },
}
