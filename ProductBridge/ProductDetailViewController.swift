import UIKit

protocol ProductDetailViewControllerDelegate: AnyObject {
    func productDetailViewControllerDidSelectFavorite(
        _ viewController: ProductDetailViewController,
        product: Product
    )
}

final class ProductDetailViewController: UIViewController {
    weak var delegate: ProductDetailViewControllerDelegate?

    private let product: Product

    private lazy var nameLabel = makeLabel(
        text: product.name,
        style: .title1
    )

    private lazy var descriptionLabel = makeLabel(
        text: product.description,
        style: .body
    )

    private lazy var priceLabel = makeLabel(
        text: product.price.formatted(.currency(code: "USD")),
        style: .headline
    )

    private lazy var favoriteButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Mark as Favorite"

        let button = UIButton(configuration: configuration)
        button.addTarget(
            self,
            action: #selector(favoriteButtonTapped),
            for: .touchUpInside
        )
        return button
    }()

    init(product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("ProductDetailViewController is programmatic")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        buildLayout()
    }
}

private extension ProductDetailViewController {
    func buildLayout() {
        view.backgroundColor = .systemBackground
        title = "Product Details"

        let stackView = UIStackView(
            arrangedSubviews: [
                nameLabel,
                descriptionLabel,
                priceLabel,
                favoriteButton
            ]
        )

        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 24
            ),
            stackView.leadingAnchor.constraint(
                equalTo: view.layoutMarginsGuide.leadingAnchor
            ),
            stackView.trailingAnchor.constraint(
                equalTo: view.layoutMarginsGuide.trailingAnchor
            )
        ])
    }

    func makeLabel(
        text: String,
        style: UIFont.TextStyle
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .preferredFont(forTextStyle: style)
        label.numberOfLines = 0
        return label
    }

    @objc
    func favoriteButtonTapped() {
        delegate?.productDetailViewControllerDidSelectFavorite(
            self,
            product: product
        )
    }
}
