## 3rd Submission
1. Please omit the redundant "The goal of texter is" from your description
text.
    - Rephrased description text.
  
2. Please always write package names, software names and API (application
programming interface) names in single quotes in title and description.
e.g: --> 'texter'
    - Changed double quotes to single quotes.
   
3. The Description field is intended to be a (one paragraph) description
of what the package does and why it may be useful.
Please add more details about the package functionality and implemented
methods in your Description text.
    - Make improvements to the description texts and now captures quick insight into package functionality.
  
4. Please add \value to .Rd files regarding exported methods and explain
the functions results in the documentation.
    - All functions now have \value describing outputs

-- R CMD check results ----------------------------------------- texter 0.0.0.9 ----
Duration: 1m 29.8s

0 errors √ | 0 warnings √ | 0 notes √

## 2nd Submission
1. Version contains large components (0.0.0.9000)
    version name has been fixed to 0.0.0.1

2. Mispelled Fields
    - imports changed to Imports
    - maintainer changed to Maintainer with the closing (>)

3. The Title field should be in title case. Previous version was:
      'An easy text and sentiment analysis library' and now is 'An Easy Text and Sentiment Analysis Library'

4. The Description field should not start with the package name,
    'This package' or similar. 


5. Non-ascii strings but some left to preserve text integrity


6. Issue downloading nrc sentiments for sentimentAnalyzer fixed 



## R CMD check results

0 errors | 1 warnings | 1 notes

#### checking package dependencies … NOTE

-   Depends: includes the non-default packages: ‘dplyr’, ‘plyr’,
    ‘ggplot2’, ‘magrittr’, ‘stringr’, ‘tidytext’, ‘purrr’, ‘stopwords’,
    ‘textdata’
-   Adding so many packages to the search path is excessive and
    importing selectively is preferable.

#### checking data for non-ASCII characters … WARNING

    Warning: found non-ASCII strings

    -- The contents have been converted from Ascii however, to preserve the contents as much as possible some of the non-ascii strings are left as is. This has been tested and won't have any effect on the results.
