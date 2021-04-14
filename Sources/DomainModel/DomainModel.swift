import Foundation

extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

struct DomainModel {
    var text = "Hello, World!"
        // Leave this here; this value is also tested in the tests,
        // and serves to make sure that everything is working correctly
        // in the testing harness and framework.
}

////////////////////////////////////
// Money
//
public struct Money {
    var amount: Double = 0.0
    var currency: String = "USD"
    
    func convert(_ unit: String) -> Money {
        var newAmount: Double = self.amount
        var newMoney: Money = Money(amount: newAmount, currency: self.currency)
        
        // convert current money and unit to USD
        switch self.currency {
        case "GBP":
            newAmount = (self.amount * 2.0).round(to: 2)
        case "EUR":
            newAmount = (self.amount * 2.0 / 3.0).round(to: 2)
        case "CAN":
            newAmount = (self.amount * 0.8).round(to: 2)
        default:
            break
        }
        
        // convert USD to unit currency
        switch unit {
        case "GBP":
            newMoney.amount = newAmount / 2
            newMoney.currency = unit
        case "EUR":
            newMoney.amount = (newAmount * 1.5).round(to: 2)
            newMoney.currency = unit
        case "CAN":
            newMoney.amount = (newAmount * 1.25).round(to: 2)
            newMoney.currency = unit
        default:
            break
        }
        
        return newMoney
    }
    
    func add(_ newMoneyRHS: Money) -> Money {
        var newMoneyLHS: Money
        var res: Money = Money()
        newMoneyLHS = self.convert(newMoneyRHS.currency)
        res.amount = newMoneyRHS.amount + newMoneyLHS.amount
        res.currency = newMoneyLHS.currency
        return res
    }
}

////////////////////////////////////
// Job
//
public class Job {
    public enum JobType {
        case Hourly(Double)
        case Salary(UInt)
    }
}

////////////////////////////////////
// Person
//
public class Person {
}

////////////////////////////////////
// Family
//
public class Family {
}
