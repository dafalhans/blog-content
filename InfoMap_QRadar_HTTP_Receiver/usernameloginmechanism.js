importClass(Packages.com.tivoli.am.fim.trustserver.sts.utilities.IDMappingE xtUtils); 
importClass(Packages.com.tivoli.am.fim.base64.BASE64Utility); 
importPackage(Packages.com.ibm.security.access.httpclient); 
 
// hard-code QRadar HTTP Receiver endpoint - TODO to see if this can further configured as Server Connection"   
var endpoint = "http://9.36.193.33:12469"; 
var bauser = ""; 
var bapassword = ""; 


// Get username from request parameters  
var username = context.get(Scope.REQUEST, "urn:ibm:security:asf:request:parameter", "username");  
IDMappingExtUtils.traceString("username from request: " + username); 
 
 
if (username != null) {     // username found, set this as the user to login     
    context.set(Scope.SESSION, "urn:ibm:security:asf:response:token:attributes", "username", username); 
    
	var RequestBody = '{"name" : "' + username + ' ", "authenticated" : "true"}' 
    var headers = new Headers();  headers.addHeader("Content-Type", "application/json");  var httpsTrustStore = 'rt_profile_keys'; 
   
   /**   
   * httpPost(String url, Map headers, String body,String httpsTrustStore,   
   * String basicAuthUsername,String basicAuthPassword, String   
   * clientKeyStore,String clientKeyAlias);
   */  
   
   var hr = HttpClient.httpPost(endpoint, headers, RequestBody, null, null, null, null, null);  
   if (hr != null) {   
          var code = hr.getCode(); // this is int   
		  var body = hr.getBody(); // this is java.lang.String 
		 
   IDMappingExtUtils.traceString("code: " + code);   
   IDMappingExtUtils.traceString("body: " + body);      
   
// sanity check the response code and body - this is "besteffort"   
if (code != 200) {    
IDMappingExtUtils.throwSTSException("Bad response code from QRadar HTTP Receiver: " + code);   } 

 ]success.setValue(true);  } 