var LoginAuth=function() {
LoginAuth.initializeBase(this);
this._timeout = 0;
this._userContext = null;
this._succeeded = null;
this._failed = null;
}
LoginAuth.prototype={
_get_path:function() {
 var p = this.get_path();
 if (p) return p;
 else return LoginAuth._staticInstance.get_path();},
ValidateLogin:function(username,password,succeededCallback, failedCallback, userContext) {
return this._invoke(this._get_path(), 'ValidateLogin',false,{username:username,password:password},succeededCallback,failedCallback,userContext); }}
LoginAuth.registerClass('LoginAuth',Sys.Net.WebServiceProxy);
LoginAuth._staticInstance = new LoginAuth();
LoginAuth.set_path = function(value) { LoginAuth._staticInstance.set_path(value); }
LoginAuth.get_path = function() { return LoginAuth._staticInstance.get_path(); }
LoginAuth.set_timeout = function(value) { LoginAuth._staticInstance.set_timeout(value); }
LoginAuth.get_timeout = function() { return LoginAuth._staticInstance.get_timeout(); }
LoginAuth.set_defaultUserContext = function(value) { LoginAuth._staticInstance.set_defaultUserContext(value); }
LoginAuth.get_defaultUserContext = function() { return LoginAuth._staticInstance.get_defaultUserContext(); }
LoginAuth.set_defaultSucceededCallback = function(value) { LoginAuth._staticInstance.set_defaultSucceededCallback(value); }
LoginAuth.get_defaultSucceededCallback = function() { return LoginAuth._staticInstance.get_defaultSucceededCallback(); }
LoginAuth.set_defaultFailedCallback = function(value) { LoginAuth._staticInstance.set_defaultFailedCallback(value); }
LoginAuth.get_defaultFailedCallback = function() { return LoginAuth._staticInstance.get_defaultFailedCallback(); }
LoginAuth.set_enableJsonp = function(value) { LoginAuth._staticInstance.set_enableJsonp(value); }
LoginAuth.get_enableJsonp = function() { return LoginAuth._staticInstance.get_enableJsonp(); }
LoginAuth.set_jsonpCallbackParameter = function(value) { LoginAuth._staticInstance.set_jsonpCallbackParameter(value); }
LoginAuth.get_jsonpCallbackParameter = function() { return LoginAuth._staticInstance.get_jsonpCallbackParameter(); }
LoginAuth.set_path("/LoginAuth.asmx");
LoginAuth.ValidateLogin= function(username,password,onSuccess,onFailed,userContext) {LoginAuth._staticInstance.ValidateLogin(username,password,onSuccess,onFailed,userContext); }