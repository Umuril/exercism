module Clock (addDelta, fromHourMin, toString) where
import Text.Printf

-- TO BE REVIEWED

data Clock = Clock { _hour :: Int, _min :: Int }
  deriving Eq

fromHourMin :: Int -> Int -> Clock
fromHourMin h m = Clock (mod (h + div m 60) 24) (mod m 60)

toString :: Clock -> String
toString (Clock h m) = printf "%02d:%02d" h m

addDelta :: Int -> Int -> Clock -> Clock
addDelta h m (Clock hh mm) = fromHourMin (h + hh) (m + mm)
