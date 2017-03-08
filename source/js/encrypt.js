
function NovaCrypt() {
  NovaCrypt.prototype.getParameterByName = function(name, url, options) {
    if (!url) url = this.src;
    var o = options || {};
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)");
    results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    var tmp = results[2].replace(/\+/g, " ");
    if (o.decode) {
      return decodeURI(tmp);
    }
    return tmp;
  };

  this.encrypt = function(code) {
    if (!!!code){
      return null;
    }
    if (this.v == '1') {
      var c = String.fromCharCode(code.charCodeAt(0) + code.length);
      for(var i=1; i < code.length; i++) {
        c += String.fromCharCode(code.charCodeAt(i) + code.charCodeAt(i-1));
      }
      return c;
    } else if (this.v == '2') {
      return md5(code);
    }
    return code;
  };

  var scripts = document.getElementsByTagName('script');
  this.src = scripts[scripts.length - 1].src;
  this.v = this.getParameterByName('v');
  this.dom = this.getParameterByName('dom');
  var tip = this.getParameterByName('tip', '', {decode: true});
  this.emsg = this.getParameterByName('emsg', '', {decode: true});
  this.code = this.getParameterByName('code');
  this.pass = false;

  tip = prompt(tip);
  var pwd = encodeURI(this.encrypt(tip));
  if (pwd === this.code) {
    this.pass = true;
  } else {
    console.log("password error!");
  }

  NovaCrypt.prototype.decrypt = function() {
    this.result();
  };

  NovaCrypt.prototype.check = function(){
    if (!this.dom) {
      // this.dom = $(this.opts.dom);
    }
  };

  NovaCrypt.prototype.show = function() {
    this.check();
    $(this.dom).html(unescape(this.content));
  };

  NovaCrypt.prototype.error = function(msg) {
    this.check();
    msg = msg ? msg : this.emsg;
    $(this.dom).html('<div class="container" style="text-align:center;color:red;">' + msg + '</div>');
  };

  NovaCrypt.prototype.result = function() {
    this.content = $(this.dom).html();
    if (this.pass) {
      this.show();
    } else {
      this.error();
    }
  };
 return this;
}
var nova_crypt = new NovaCrypt();
