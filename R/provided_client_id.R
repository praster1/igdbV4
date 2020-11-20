#Checks if Client-ID is set.
provided_client_id = function()
{
	if("Client-ID" %in% names(options()$httr_config$headers)) return(TRUE)
	return(FALSE)
}

#No Client-ID error
#err_no_id = 'stop("Please set a Client-ID value with twitch_auth().")'