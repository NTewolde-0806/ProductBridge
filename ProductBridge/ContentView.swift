import SwiftUI

struct ContentView: View {
    private let products = Product.samples

    @State private var selectedProduct: Product?
    @State private var favoriteProductID: Product.ID?

    var body: some View {
        NavigationStack {
            List(products) { product in
                Button {
                    selectedProduct = product
                } label: {
                    productRow(product)
                }
                .buttonStyle(.plain)
            }
            .navigationTitle("Products")
            .sheet(item: $selectedProduct) { product in
                ProductDetailViewControllerRepresentable(
                    product: product,
                    favoriteProductID: $favoriteProductID
                )
            }
        }
    }
}

private extension ContentView {
    func productRow(_ product: Product) -> some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(product.name)
                    .font(.headline)

                Text(product.price.formatted(
                    .currency(code: "USD")
                ))
                .font(.subheadline)
                .foregroundStyle(.secondary)
            }

            Spacer()

            if favoriteProductID == product.id {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
                    .accessibilityLabel("Favorite")
            }

            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundStyle(.tertiary)
        }
        .contentShape(Rectangle())
    }
}

#Preview {
    ContentView()
}
