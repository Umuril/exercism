module Clock (addDelta, fromHourMin, toString) where
import Text.Printf

data Clock = Clock { hour :: Int, min :: Int }
  deriving Eq

fromHourMin :: Int -> Int -> Clock
fromHourMin hour min = Clock (mod (hour + div min 60) 24) (mod min 60)

toString :: Clock -> String
toString clock = printf "%02d:%02d" (Clock.hour clock) (Clock.min clock)

addDelta :: Int -> Int -> Clock -> Clock
addDelta h m clock = fromHourMin (h + (Clock.hour clock)) (m + (Clock.min clock))
