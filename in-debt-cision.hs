type Principle = Float
type Rate = Float
type MinPayment = Float
type TotalMonths = Int
type TotalInterest = Float

data Loan = Loan Principle Rate MinPayment TotalMonths TotalInterest deriving Show
--
interest :: Principle -> Rate -> Float
interest p r = r/12*p

applyBigPayment :: Float -> Loan -> Loan 
applyBigPayment payment (Loan p r mp tm ti) = (Loan (p-(payment-i)) r mp (tm+1) (ti+i))
	where i = interest p r

applyMinPayment :: Loan -> Loan 
applyMinPayment (Loan p r mp tm ti) = (Loan (p-(mp-i)) r mp (tm+1) (ti+i)) 
	where i = interest p r

applyLastPayment :: Loan -> Loan 
applyLastPayment (Loan p r mp tm ti) = (Loan 0.0 r mp (tm+1) (ti+i))	
	where i = interest p r

payOffLoans :: Float -> [Loan] -> [Loan]
payOffLoans extraCash [] = []  
payOffLoans extraCash (l:ls)  
	| principle l <= 0 = (l:ls) -- if principle is zero we're back to the first loan and all is paid off 
	| principle l <= extraCash = payOffLoans (extraCash + minpayment l) ((map applyMinPayment ls) ++ [(applyLastPayment l)]) --put paid off loan at end of list 
	| otherwise = payOffLoans extraCash ((applyBigPayment extraCash l):map applyMinPayment ls)
		where principle (Loan p _ _ _ _) = p;
					minpayment (Loan _ _ mp _ _) = mp

mainFunc :: Float -> [Loan] -> String 
mainFunc xc ls = (output . map outcome . payOffLoans xc) ls
	where outcome (Loan _ _ _ tm ti) = (tm, ti); 
				output xs = "It would take you " ++ show (fst (last xs)) ++ " months to pay off your debts and cost you $" ++ show (foldr (\(_, i) acc -> acc+i) 0 xs) ++ 
					" if you did the debt snowball in the given order. Reorder your loans to see if there's a more efficient way!"
