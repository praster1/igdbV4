\name{twitch_auth}
\alias{twitch_auth}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
twitch_auth(client_id = "", client_secret = "")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{client_id}{
%%     ~~Describe \code{client_id} here~~
}
  \item{client_secret}{
%%     ~~Describe \code{client_secret} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (client_id = "", client_secret = "") 
{
    if (client_id == "" | client_secret == "") {
        stop("Please add TWITCH_CLIENT_ID and TWITCH_CLIENT_SECRET to your environment variables (see documentation for reference).")
    }
    o = httr::POST("https://id.twitch.tv/oauth2/token", query = query_list(client_id = client_id, 
        client_secret = client_secret, grant_type = "client_credentials")) \%>\% 
        content()
    httr::set_config(httr::add_headers(`Client-ID` = client_id, 
        Authorization = paste0("Bearer ", o$access_token)))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
