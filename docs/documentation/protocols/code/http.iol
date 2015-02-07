type HttpConfiguration:void {

	/*
	* Defines a set of "headersNames" corresponding to
	* the values received in the header of a request.
	*
	* Default: none
	*/
	.headers?:void {
		/*
		* Defines the name of a header an references
		* its value
		*
		* Default: none
		*/
		.headerName*: string
	}

	/*
	 * Set additional headers on HTTP requests
	 *
	 * Default: none
	 */
	.addHeader?:void {
		.header*:string {
			.value:string
		}
	}

	/*
	 * Specifies the default HTTP handler method(s) on a server
	 * This is required for CRUD applications but also used in Leonardo which sets
	 * it to default()() (setting default = "default").
	 *
	 * Default: none
	 */
	.default?:string {
		/*
		 * Handler for specific HTTP request methods: eg. .default.put = "put"
		 *
		 * Default: none
		 */
		.httpMethod*:string
	}

	/*
	* Defines the status code of the HTTP message.
	*
	* Default: 200
	* Supported Values: any HTTP status codes
	*/
	.statusCode?:string

	/*
	 * Defines the cache-control header of the HTTP message.
	 */
	.cacheControl?:void {
		/*
		 * Maximum age for which the resource should be cached (in seconds)
		 */
		.maxAge?:int
	}

	/*
	* Defines the content type of the HTTP message.
	*
	* Default: none
	*/
	.contentType?:string

	/*
	* Defines the content type of the HTTP message.
	*
	* Default: none
	*/		
	.charset?:string

	/*
	* Enable content compression in HTTP.
	* On client side the "Accept-Encoding" header is set to "gzip, deflate"
	* or according to "requestCompression". On the server the compression is
	* enabled using gzip or deflate as the client requested it. gzip is
	* preferred over deflate since it is more common.
	* If the negotiation was successful, the server returns the compressed data
	* with a "Content-Encoding" header and an updated "Content-Length" field.
	*
	* Default: true
	*/
	.compression?:bool

	/*
	* Set the allowed mimetypes (content types) for compression.
	* This flag operates server-side only and is unset per default, which means
	* that common plain-text formats get compressed (among them text/html
	* text/css text/plain text/xml text/x-js application/json
	* application/javascript). The delimitation character should be different to
	* the mimetype names, valid choices include blank, comma or semicolon.
	*
	* "*" means compression for everything including binary formats, which is
	* usually not the best choice. Many formats come pre-compressed, like
	* archives, images or videos.
	*
	* Other webservers (Apache Tomcat, Apache HTTP mod_deflate) contain similar
	* filter variables.
	*
	* Default: common plain-text formats
	*/
	.compressionTypes?:string

	/*
	* Enables the HTTP request compression feature.
	* HTTP 1.1 per RFC 2616 defines optional compression also on POST requests,
	* which works unless HTTP errors are returned, for instance 415 Unsupported
	* Media Type.
	* Jolie allows to set the parameter to "gzip" or "deflate" which overrides
	* also the "Accept-Encoding" header. This invites the server to use the same
	* algorithm for the response compression.
	* Invalid values are ignored, the compression mimetypes are enforced.
	* If all conditions are met, the request content gets compressed, an
	* additional "Content-Encoding" header added and the "Content-Length"
	* header recalculated.
	*
	* Default: none/off
	*/
	.requestCompression?:string

	/*
	* Defines the format of the HTTP message.
	*
	* Default: none
	*/
	.format?:string
	
	/*
	* Defines the Content-Transfer-Encoding value of the HTTP message.
	*
	* Default: none
	*/
	.contentTransferEncoding?:string
	
	/*
	* Defines the Content-Disposition value of the HTTP message.
	*
	* Default: none
	*/
	.contentDisposition?:string

	/*
	* Defines the redirecting location subsequent to
	* a Redirection 3xx status code
	*
	* Default: none
	*/
	.redirect?:string

	/*
	 * Defines the character set to use for (de-)coding strings.
	 *
	 * Default: "UTF-8"
	 * Supported values: "US-ASCII", "ISO-8859-1", 
	 * "UTF-8", ... (all possible Java charsets)
	 */
	.charset?:string

	/*
	 * Defines whether the underlying connection should be kept open.
	 *
	 * Default: true
	 */
	.keepAlive?:bool

	/*
	* Defines whether the requests handled by the service
	* are thread-safe or not.
	* 
	* Default: 
	*	send 	-> true
	*	receive -> false
	*/
	.concurrent?: bool

	/*
	* Defines whether debug messages shall be 
	* activated
	*
	* Default: false
	*/
	.debug?:bool

	/*
	* Defines a set of operation-specific aliases,
	* multi-part headers, and parameters.
	*
	* Default: none
	*/
	.osc?:void {
		.operationName*:void {
			/*
			* Defines the name of a parameter specific to 
			* "operationName"
			*
			* Default: none
			*/
			.parameterName?: void
			/*
			* Defines a HTTP alias which represents 
			* an alternative name to the location of
			* "operationName"
			*
			* Default: none
			* Supported values: URL address, string raw
			*/
			.alias*: string
			/*
			* Defines the elements composing a multi-part 
			* request for a specific operation.
			*
			* Default: none
			*/
			.multipartHeaders?:void {
				/*
				* Defines the name of the part of 
				* the multi-part request
				* 
				* Default: none
				*/
				.partName*:void {
					/*
					* Defines the name of the file
					* corresponding to a specific part
					*
					* Default: none
					*/
					.filename?:string
				}
			}
		}
	}

	/*
	* Defines a set of cookies used in the http communication
	*
	* Default: none
	*/
	.cookies?:void {
		/*
		* Defines a cookie named
		* "cookieName"
		* Default: none
		*/
		.cookieName*:void {
			/*
			* Defines the configuration of a cookie
			* 
			* Default: none
			*/
			.cookieConfig?:string{
				/*
				* Defines the domain of the cookie
				*
				* Default: ""
				*/
				.domain?:string
				/*
				* Defines the expiration time of the cookie
				*
				* Default: ""
				*/
				.expires?:string
				/*
				* Defines the "path" value of the cookie
				*
				* Default: ""
				*/
				.path?:string{}
				/*
				* Defines whether the cookie shall be encrypted 
				* and sent via HTTPS
				*
				* Default: 0
				*/
				.secure?:int{}
				/*
				* Defines the type of the cookie
				* 
				* Default: string
				*/
				.type?:string
			}
		}

	}
	
	/*
	* Defines the request method used by a port
	*
	* Default: "POST"
	* Supported values: "GET", "POST"
	*/
	.method?:string {
		/*
		 * "queryFormat" on a GET request may be set to "json" to have the
		 * parameters passed as JSON
		 *
		 * Default: none
		 */
		.queryFormat?:string
	}

	/*
	* Overrides the HTTP User-Agent header value on incoming HTTP messages
	*
	* Default: none
	*/
	.userAgent?:string

	/*
	 * Overrides the HTTP host header on incoming HTTP messages
	 *
	 * Default: none
	 */
	.host?:string
}
