# Fetch-Data-Analyst-Manager
Responses for the Fetch Data Analyst Manager Position Take Home Assessment

First: explore the data
Review the unstructured csv files and answer the following questions with code that supports your conclusions:

    Are there any data quality issues present?
    Are there any fields that are challenging to understand?

Responses to this Exercise can be found in the Fetch Assessment Data Quality Issues.pdf file


Second: provide SQL queries
Answer three of the following questions with at least one question coming from the closed-ended and one from the open-ended question set. Each question should be answered using one query.
Closed-ended questions:

    What are the top 5 brands by receipts scanned among users 21 and over?
        Query can be found in the Top 5 brands by 21+.sql file with notes and assumptions
        Answer: Top 5 brands in order from top to 5th are Dove, Nerds Candy, Trident, Meijer, and Hershey's
        
    What are the top 5 brands by sales among users that have had their account for at least six months?
        Query can be found in the Top 5 brands for 6 month users.sql file with notes and assumptions
        Answer: Top 5 brands in order from top to 5th are CVS, Trident, Dove, Coors Light, Quaker
        
    What is the percentage of sales in the Health & Wellness category by generation?
        Query can be found in the Percent H&W by generation.sql file with notes and assumptions
        Answer: Generations were determined using a 20-year window 
                1940-1959: 65.07%
                1960-1979: 43.39%
                1980-1999: 51.14%
                No birthdate value: 60.4%


Open-ended questions: for these, make assumptions and clearly state them when answering the question.

    Who are Fetch’s power users?
        Query can be found in the Fetch's Power Users.sql file with notes and assumptions
        Answer: Power Users were defined as users with 3 transactions. The query will produce a list of all user_ids and
        their total number of transactions, with a minimum of 0 and a maximum of 3
        
    Which is the leading brand in the Dips & Salsa category?
        Query can be found in the Dips & Salsa Leading Brand.sql file with notes and assumptions
        Answer: The leading brand based on total quantity was Tostitos with a quantity of 60
        
    At what percent has Fetch grown year over year?
        Query can be found in the Fetch Growth YoY.sql file with notes and assumptions
        Answer: The table produced by the query with show the year, new users, the previous year's total users, and the %
        increase, comparing this year's new userd to the last year's total users. 2017 showed the largest percentage growth
        at 427% but 2022 showed the largest number of new users at 26,811

Third: communicate with stakeholders
Construct an email or slack message that is understandable to a product or business leader who is not familiar with your day-to-day work. Summarize the results of your investigation. Include:

    Key data quality issues and outstanding questions about the data
    One interesting trend in the data
        Use a finding from part 2 or come up with a new insight
    Request for action: explain what additional help, info, etc. you need to make sense of the data and resolve any outstanding issues

The email, prepared for fictional stakeholder Kim, can be found in the Fetch Email.pdf file
