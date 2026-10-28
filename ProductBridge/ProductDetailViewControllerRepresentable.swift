import SwiftUI

struct ProductDetailViewControllerRepresentable:
    UIViewControllerRepresentable {

    let product: Product
    @Binding var favoriteProductID: Product.ID?

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(
        context: Context
    ) -> ProductDetailViewController {
        let viewController = ProductDetailViewController(
            product: product
        )

        viewController.delegate = context.coordinator
        return viewController
    }

    func updateUIViewController(
        _ viewController: ProductDetailViewController,
        context: Context
    ) {
        // No update is currently required because the product is
        // immutable for the lifetime of this detail presentation.
    }
}

extension ProductDetailViewControllerRepresentable {
    @MainActor
    final class Coordinator:
        NSObject,
        ProductDetailViewControllerDelegate {

        private var parent:
            ProductDetailViewControllerRepresentable

        init(parent: ProductDetailViewControllerRepresentable) {
            self.parent = parent
        }

        func productDetailViewControllerDidSelectFavorite(
            _ viewController: ProductDetailViewController,
            product: Product
        ) {
            parent.favoriteProductID = product.id
        }
    }
}
