import Foundation

struct Product: Identifiable, Equatable {
    let id: UUID
    let name: String
    let description: String
    let price: Decimal

    init(
        id: UUID = UUID(),
        name: String,
        description: String,
        price: Decimal
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.price = price
    }
}

extension Product {
    static let samples: [Product] = [
        Product(
            name: "Trail Backpack",
            description: "A lightweight backpack for everyday adventures.",
            price: 79.99
        ),
        Product(
            name: "Travel Mug",
            description: "An insulated mug that keeps drinks warm.",
            price: 24.99
        ),
        Product(
            name: "Desk Lamp",
            description: "An adjustable lamp with soft, focused lighting.",
            price: 49.99
        )
    ]
}
