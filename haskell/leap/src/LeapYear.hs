module LeapYear (isLeapYear) where
import Data.Bits

isLeapYear :: Word -> Bool
isLeapYear year = ((year .&. 3) == 0 && ((rem year 25) /= 0 || (year .&. 15) == 0))