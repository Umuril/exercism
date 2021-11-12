#[derive(Debug)]
pub enum CalculatorInput {
    Add,
    Subtract,
    Multiply,
    Divide,
    Value(i32),
}

fn extract_two_values_and_apply<F>(stack: &mut Vec<i32>, func: F) -> Option<i32>
where
    F: Fn(i32, i32) -> i32,
{
    let a = stack.pop();
    let b = stack.pop();
    match (a, b) {
        (Some(a), Some(b)) => Some(func(b, a)),
        _ => None,
    }
}

pub fn evaluate(inputs: &[CalculatorInput]) -> Option<i32> {
    let mut stack: Vec<i32> = vec![];
    for input in inputs {
        let new_value = match input {
            CalculatorInput::Add => extract_two_values_and_apply(&mut stack, std::ops::Add::add),
            CalculatorInput::Subtract => {
                extract_two_values_and_apply(&mut stack, std::ops::Sub::sub)
            }
            CalculatorInput::Multiply => {
                extract_two_values_and_apply(&mut stack, std::ops::Mul::mul)
            }
            CalculatorInput::Divide => extract_two_values_and_apply(&mut stack, std::ops::Div::div),
            CalculatorInput::Value(v) => Some(*v),
        };
        match new_value {
            None => return None,
            Some(v) => stack.push(v),
        }
    }
    match stack.len() {
        1 => stack.pop(),
        _ => None,
    }
}
