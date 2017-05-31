# in-debt-cision
Tool to find most efficient way of paying off loans written in haskell

This is a rough haskell version of my DebtPayingAlgorithms that I wrote in C#.
Although it's not as polished in that it won't give you different ways to pay off your debts. 
You have to reorder them yourself to find out what's more efficient and 
it doesn't take user input so you have to load the module and call the function manually through ghci

&#36;`sudo apt-get install ghc`<br>
&#36;`ghci`<br>
&gt;`:load in-debt-cision.hs`<br>
&gt;`mainFunc 1000 [(Loan 10000 0.047 200 0 0), (Loan 15000 0.06 50 0 0)]`<br>
`"It would take you 25 months to pay off your debts and cost you $1529.1082 if you did the debt snowball in the given order. 
Reorder your loans to see if there's a more efficient way!"`

This example would assume you have something like a $10,000 car loan with 4.7% interest with a minimum payment of $200 
and a $15,000 student loan with an interest rate of 6% and a $50 minimum payment. 
And that you have an extra $1000/month to put towards your debt. 
The two 0's at the end of the Loans is for months and interest paid on the loan. If you want a grand total for the entire life of the loan you can put how many months you've had the loan and the interest you've already paid instead of zeros. 
