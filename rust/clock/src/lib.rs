use std::fmt;

#[derive(PartialEq, fmt::Debug)]
pub struct Clock {
    minutes: i32,
}

const MINUTES_IN_HOUR: i32 = 60;
const HOURS_IN_DAY: i32 = 24;
const MINUTES_IN_DAY: i32 = HOURS_IN_DAY * MINUTES_IN_HOUR;

impl Clock {
    pub fn from_minutes(minutes: i32) -> Self {
        Clock {
            minutes: minutes.rem_euclid(MINUTES_IN_DAY),
        }
    }

    pub fn new(hours: i32, minutes: i32) -> Self {
        Clock::from_minutes(hours * MINUTES_IN_HOUR + minutes)
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        Clock::from_minutes(self.minutes + minutes)
    }

    pub fn hours(&self) -> i32 {
        self.minutes.div_euclid(MINUTES_IN_HOUR)
    }

    pub fn minutes(&self) -> i32 {
        self.minutes.rem_euclid(MINUTES_IN_HOUR)
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.hours(), self.minutes())
    }
}
