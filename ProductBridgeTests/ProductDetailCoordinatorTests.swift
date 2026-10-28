import XCTest
import SwiftUI
@testable import ProductBridge

final class ProductDetailCoordinatorTests: XCTestCase {
    @MainActor
    func testDelegateCallbackUpdatesFavoriteProductID() {
        let product = Product(
            id: UUID(),
            name: "Trail Backpack",
            description: "A lightweight backpack.",
            price: 79.99
        )

        var favoriteProductID: Product.ID?

        let binding = Binding<Product.ID?>(
            get: {
                favoriteProductID
            },
            set: {
                favoriteProductID = $0
            }
        )

        let representable =
            ProductDetailViewControllerRepresentable(
                product: product,
                favoriteProductID: binding
            )

        let coordinator = representable.makeCoordinator()
        let viewController = ProductDetailViewController(
            product: product
        )

        coordinator
            .productDetailViewControllerDidSelectFavorite(
                viewController,
                product: product
            )

        XCTAssertEqual(favoriteProductID, product.id)
    }
}
