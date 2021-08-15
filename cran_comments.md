## New Submission
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
