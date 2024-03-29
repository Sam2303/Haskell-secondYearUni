-- We don't import '||' from the prelude, so that we can
-- define our own version

import Prelude hiding ((||))

-- The following line declares the || operator (which we are about to
-- re-define) to be right associative and to have precedence 2. This
-- is necessary in order for expressions such as False || x > 2 to be
-- valid (e.g. it sets the precedence of || to be lower than >).

infixr 2  ||

-- A naive re-implementation of the Prelude operator ||
(||) :: Bool -> Bool -> Bool
True || True    = True
False || True   = True
True || False   = True
False || False  = False

-- An alternative re-implementation
--(||) :: Bool -> Bool -> Bool
--False || False   = False
--_ || _           = True

-- Another alternative re-implementation
--(||) :: Bool -> Bool -> Bool
--True || _     =  True
--False || a    = a


fact :: Int -> Int
fact n
    | n == 0    = 1
    | n > 0     = n * fact (n - 1)
    | otherwise = error "factorials not defined for negative ints"

mult :: Int -> Int -> Int
mult n m
    | n == 0        = 0
    | n > 0         = m + mult (n - 1) m

divide :: Int -> Int -> Int
divide n m
    | n < m         = 0
    | otherwise     = 1 + divide (n - m) m



sumNumbers :: Int -> Int
sumNumbers x
    | x == 0 = 0
    | x > 0 = x + sumNumbers(x-1)


sumSquares :: Int -> Int
sumSquares x
    | x == 0 = 0
    | x > 0 = x^2 + sumSquares(x-1)


power :: Int -> Int -> Int
power x y
    | y == 0 = 1
    | y > 0 = x * power x (y-1)
