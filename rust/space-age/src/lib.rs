// The code below is a stub. Just enough to satisfy the compiler.
// In order to pass the tests you can add-to or change any of this code.

#[derive(Debug)]
pub struct Duration {
    sec: u64,
}

impl Duration {
    fn years(&self) -> f64 {
        self.sec as f64 / 31_557_600.0
    }
}

impl From<u64> for Duration {
    fn from(s: u64) -> Self {
        Duration { sec: s }
    }
}

pub trait Planet {
    const RATIO_TO_EARTH: f64;

    fn years_during(d: &Duration) -> f64 {
        d.years() / Self::RATIO_TO_EARTH
    }
}

macro_rules! planet {
    ($planet_name:ty, $ratio:tt) => {
        impl Planet for $planet_name {
            const RATIO_TO_EARTH: f64 = $ratio;
        }
    };
}

pub struct Mercury;
pub struct Venus;
pub struct Earth;
pub struct Mars;
pub struct Jupiter;
pub struct Saturn;
pub struct Uranus;
pub struct Neptune;

planet!(Mercury, 0.2408467);
planet!(Venus, 0.61519726);
planet!(Earth, 1.0);
planet!(Mars, 1.8808158);
planet!(Jupiter, 11.862615);
planet!(Saturn, 29.447498);
planet!(Uranus, 84.016846);
planet!(Neptune, 164.79132);
