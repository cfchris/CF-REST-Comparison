component {

	this.name = "cfobjective_rest_relaxation";
	this.datasource = "cfobjective12_rest";
	this.mappings = {};

	this.mappings["/model"] = expandPath('../_model');
	this.mappings["/com"] = expandPath('./com');
	
	/**
	* @hint "I handle the start of requests. (Make sure Relaxation is setup.)"
	* @output true
	**/
	public function onRequestStart() {
		if ( isDefined("url.Reinit") || isNull(application.REST) ) {
			application.REST = new com.Relaxation.Relaxation( "./RestConfig.json.cfm" );
		}
	}
	
	/**
	* @hint "I handle requests. (Route requests using Relaxation.)"
	* @output true
	**/
	public void function onRequest() {
		application.REST.handleRequest();
	}

}