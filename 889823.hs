--
-- MATHFUN
--
-- UP889823
--
import Data.Char
import Data.List
import Text.Printf



--
-- Types (define Place type here)

type Place  =  (String,  Float,  Float,  [Int])
--

testData :: [Place]
testData = [("London"       ,(51.5),  (-0.1),   [0, 0, 5, 8, 8, 0, 0]),
            ("Cardiff"      ,(51.5),  (-3.2),   [12, 8, 15, 0, 0, 0, 2]),
            ("Norwich"      ,(52.6),  ( 1.3),   [0, 6, 5, 0, 0, 0, 3]),
            ("Birmingham"   ,(52.5),  (-1.9),   [0, 2, 10, 7, 8, 2, 2]),
            ("Liverpool"    ,(53.4),  (-3.0),   [8, 16, 20, 3, 4, 9, 2]),
            ("Hull"         ,(53.8),  (-0.3),   [0, 6, 5, 0, 0, 0, 4]),
            ("Newcastle"    ,(55.0),  (-1.6),   [0, 0, 8, 3, 6, 7, 5]),
            ("Belfast"      ,(54.6),  (-5.9),   [10, 18, 14, 0, 6, 5, 2]),
            ("Glasgow"      ,(55.9),  (-4.3),   [7, 5, 3, 0, 6, 5, 0]),
            ("Plymouth"     ,(50.4),  (-4.1),   [4, 9, 0, 0, 0, 6, 5]),
            ("Aberdeen"     ,(57.1),  (-2.1),   [0, 0, 6, 5, 8, 2, 0]),
            ("Stornoway"    ,(58.2),  (-6.4),   [15, 6, 15, 0, 0, 4, 2]),
            ("Lerwick"      ,(60.2),  (-1.1),   [8, 10, 5, 5, 0, 0, 3]),
            ("St Helier"    ,(49.2),  (-2.1),   [0, 0, 0, 0, 6, 10, 0])]

--
--  Your functional code goes here
--

-- i
displayLocations :: [Place] -> [String]
displayLocations x = [name | (name, float1, float2, int) <- x]

--ii
averageRainfall :: String -> [Place] -> Float
averageRainfall city ((location, float1, float2, int):place)
    | city == location =  average
    | otherwise = averageRainfall city place
    where
        average = fromIntegral (sum int) / 7



-- iii -- NEED TO MAKE IT LOOK NEAT!
placesToString :: [Place] -> String
placesToString [] = []
placesToString ((location, float1, float2, rainfall):place) =
    location ++ take (15 - length location) (cycle " ") ++
        intercalate " | "  (map show rainfall ) ++
            "\n \n" ++ placesToString place



--  iv
dryNames :: [Place] -> Int -> [String]
dryNames place days = [location | (location, float1, float2, rainfall) <- place, rainfall !!(days-1) == 0]


-- v




-- updateRainfall :: [Place] -> [Int] -> [Place]
-- updateRainfall  _ [] = []
-- updateRainfall ((location, float1, float2, rainfall):place) (x:xs)
--     | rainfall !!6 = updateRainfall place xs




--vi
-- replaceData :: String ->[Place] -> Place -> [Place]
-- replaceData oldPlace ((location, float1, float2, rainfall):place)
--     ((newLocation, newFloat1, newFloat2, newRainfall):newPlace)
--         | newPlace == [] = []
--         | oldPlace ==  location = ((newLocation, newFloat1, newFloat2, newRainfall):place) replaceData oldPlace place newPlace
--         | otherwise = replaceData oldPlace place newPlace



--
--  Demo
--

demo :: Int -> IO ()
demo 1  = print (displayLocations testData) -- display the names of all the places
demo 2 = printf "%.2f\n" (averageRainfall "Cardiff" testData) -- display, to two decimal places, the average rainfall in Cardiff
demo 3 = putStrLn (placesToString testData)
demo 4 =  print (dryNames testData 2) -- display the names of all places that were dry two days ago
--demo 5 = print (updateRainfall testData [0,8,0,0,5,0,0,3,4,2,0,8,0,0])
-- update the data with most recent rainfall
--          --[0,8,0,0,5,0,0,3,4,2,0,8,0,0] (and remove oldest rainfall figures)

--demo 6 = print (replaceData "Plymouth" testData [("London")       ,(51.5),  (-0.1),   [0, 0, 5, 8, 8, 0, 0]] )
-- replace "Plymouth" with "Portsmouth" which has
--          -- location 50.8 (N), -1.1 (E) and rainfall 0, 0, 3, 2, 5, 2, 1


-- demo 7 = -- display the name of the place closest to 50.9 (N), -1.3 (E)
--          -- that was dry yesterday


-- demo 8 = -- display the rainfall map


--
-- Screen Utilities (use these to do the rainfall map - note that these do
-- not work in WinGHCi on Windows, so use GHCi.)
--

type ScreenPosition = (Int,Int)

-- Clears the screen
clearScreen :: IO ()
clearScreen = putStr "\ESC[2J"

-- Moves to a position on the screen
goTo :: ScreenPosition -> IO ()
goTo (x, y) = putStr ("\ESC[" ++ show y ++ ";" ++ show x ++ "H")

-- Writes a string at a position on the screen
writeAt :: ScreenPosition -> String -> IO ()
writeAt position text = do
    goTo position
    putStr text


--
-- Your rainfall map code goes here
--



--
-- Your user interface (and loading/saving) code goes here
--
