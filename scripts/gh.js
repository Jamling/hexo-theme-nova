"use strict";

var _ = require('lodash');
// npm install urllib-sync
var request = require('urllib-sync').request;
// see https://github.com/node-modules/urllib

function GitHub(host, opts){
  this.host = host || "https://api.github.com/";
  this.opts = opts || {
    dataType: 'json',
    timeout: 10000,
    headers: {
      'Accept': 'application/vnd.github.v3+json'
    }
  }
}


GitHub.prototype.reqSync = function(path, options){
    var o = options || {};
    var res = request(this.host + path, _.extend(this.opts, o));
    if (res.err) {
      console.error(res.err);
      return;
    }
    var limit = 0;
    if (res.headers.X-RateLimit-Limit){
      limit = res.headers.X-RateLimit-Limit;
    }
    var remain = 0;
    if (res.headers.X-RateLimit-Remaining){
      remain = res.headers.X-RateLimit-Remaining;
    }
    var reset = '';
    if (res.headers.X-RateLimit-Reset){
      reset = new Date(res.headers.X-RateLimit-Reset * 1000);
    }
    
    console.log('rate limit:%d,remaining:%d,reset:%s', limit, remain, reset);
    if (!res.statusCode == 200){
      console.error(res.data);
      return res.message;
    }
    return res.data;
}

module.exports = GitHub;