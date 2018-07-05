import Foundation

protocol Pattern {
    
}

//-------------  命令模式 -------------
protocol Order {
    func execute()
}

class Stock {
    
    private let name = "ABC"
    private let quantity = 10
    
    func buy() {
        print("Stock name: \(name), quantity: \(quantity) bought")
    }
    
    func sell() {
        print("Stock name: \(name), quantity: \(quantity) sold")
    }
    
}


class BuyStock: Order {
    private var stock: Stock
    
    init(stock: Stock) {
        self.stock = stock
    }
    
    func execute() {
        stock.buy()
    }
}


class SellStock: Order {
    private var stock: Stock
    
    init(stock: Stock) {
        self.stock = stock
    }
    
    func execute() {
        stock.sell()
    }
}

class Broker {
    private var orderList = [Order]()
    
    public func takeOrder(order: Order) {
        orderList.append(order)
    }
    
    public func placeOrders() {
        for order in orderList {
            order.execute()
        }
        orderList.removeAll()
    }
}

let stock = Stock()
let buyStock = BuyStock(stock: stock)
let sellStock = SellStock(stock: stock)

let broker = Broker()
broker.takeOrder(order: buyStock)
broker.takeOrder(order: sellStock)

broker.placeOrders()


